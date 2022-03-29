
#include <cudnn.h>
#include <stdio.h>
#include <cuda.h>
#include <malloc.h>
#include <cstdlib>
#include <time.h>
#include <iostream>
#include <sys/types.h>
#include <errno.h>
#include <vector>
#include <fstream>
#include <string>
#define TH 3
#define TW 2
#define N1 160
#define N2 96
#define N3 128
#define Channel 1
#define TC 8
#define TCS ((N1-1)/TC + 1)
#define Height 28
#define Width 28
#define R 3
#define S 3
#define THS ((Height-1)/TH + 1)
#define TWS ((Width-1)/TW+1)
#define K_SIZE (N1*Channel)
#if TC > (TH*TW)
#define REGISTER_BUFFER_SIZE (TC)
#else
#define REGISTER_BUFFER_SIZE (TH*TW)
#endif
using namespace std;
#define checkCUDNN(expression)                               \
  {                                                          \
    cudnnStatus_t status = (expression);                     \
    if (status != CUDNN_STATUS_SUCCESS) {                    \
      std::cerr << "Error on line " << __LINE__ << ": "      \
                << cudnnGetErrorString(status) << std::endl; \
      std::exit(EXIT_FAILURE);                               \
    }                                                        \
  }
inline void chkerr(cudaError_t code)
{
    if (code != cudaSuccess)
    {
        std::cerr << "ERROR!!!:" << cudaGetErrorString(code) <<endl;
        exit(-1);
    }
}
class Conv{
public:
    unsigned int H;
    unsigned int W;
    unsigned int C;
    unsigned int B;
    unsigned int N;
    unsigned int PAD;
    unsigned int hOut;
    unsigned int wOut;
    float *cpuKernel;
    float alpha = 1.0f;
    float beta = 0.0f;
    cudnnHandle_t convCudnn;
    void* d_workspace{nullptr};
    size_t workspace_bytes{0};
    cudnnTensorDescriptor_t convInputDescriptor;
    cudnnTensorDescriptor_t convOutputDescriptor;
    cudnnFilterDescriptor_t convKernelDescriptor;
    cudnnConvolutionDescriptor_t convDesc;
    float *output;
    float *kernel;
    void initialize(unsigned int b,unsigned int c,unsigned int h,unsigned int w,unsigned int n,
                    unsigned int pad,unsigned int r,unsigned int s,unsigned int stride);
    float *forward(float *input);
};
void Conv::initialize(unsigned int b,unsigned int c,unsigned int h,unsigned int w,unsigned int n,
                      unsigned int pad,unsigned int r,unsigned int s,unsigned int stride){
    this->B = b;
    this->C = c;
    this->H = h;
    this->W = w;
    this->N = n;
    this->hOut = (H+2*pad - r)/stride + 1;
    this->wOut = (W+2*pad - s)/stride + 1;
    cudaMalloc(&kernel,sizeof(float)*C*N*r*s);
    cudaMalloc(&this->output,sizeof(float)*B*hOut*wOut*N);
    cudnnCreate(&convCudnn);
    cudnnCreateTensorDescriptor(&convInputDescriptor);
    cudnnSetTensor4dDescriptor(convInputDescriptor,
            /*format=*/CUDNN_TENSOR_NHWC,
            /*dataType=*/CUDNN_DATA_FLOAT,
            /*batch_size=*/B,
            /*channels=*/C,
            /*image_height=*/H,
            /*image_width=*/W);
    cudnnCreateFilterDescriptor(&convKernelDescriptor);
    cudnnSetFilter4dDescriptor(convKernelDescriptor,
            /*dataType=*/CUDNN_DATA_FLOAT,
            /*format=*/CUDNN_TENSOR_NCHW,
            /*out_channels=*/N,
            /*in_channels=*/C,
            /*kernel_height=*/r,
            /*kernel_width=*/s);
    cudnnCreateConvolutionDescriptor(&convDesc);
    cudnnSetConvolution2dDescriptor(convDesc,
            /*pad_height=*/pad,
            /*pad_width=*/pad,
            /*vertical_stride=*/stride,
            /*horizontal_stride=*/stride,
            /*dilation_height=*/1,
            /*dilation_width=*/1,
            /*mode=*/CUDNN_CROSS_CORRELATION,
                                    CUDNN_DATA_FLOAT);
    int batch_size{0}, channels{0}, height{0}, width{0};
    cudnnGetConvolution2dForwardOutputDim(convDesc,
                                          convInputDescriptor,
                                          convKernelDescriptor,
                                          &batch_size,
                                          &channels,
                                          &height,
                                          &width);
    cudnnCreateTensorDescriptor(&convOutputDescriptor);
    cudnnSetTensor4dDescriptor(convOutputDescriptor,
            /*format=*/CUDNN_TENSOR_NHWC,
            /*dataType=*/CUDNN_DATA_FLOAT,
            /*batch_size=*/B,
            /*channels=*/N,
            /*image_height=*/hOut,
            /*image_width=*/wOut);
    cudnnGetConvolutionForwardWorkspaceSize(convCudnn,
                                            convInputDescriptor,
                                            convKernelDescriptor,
                                            convDesc,
                                            convOutputDescriptor,
                                            CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM,
                                            &workspace_bytes);
    cudaMalloc(&d_workspace, workspace_bytes);
    unsigned int kernelSize = r*s*C*N;//kernel
    this->cpuKernel = (float *)malloc(kernelSize*sizeof(float));
    for(int i=0;i<kernelSize;++i){
        this->cpuKernel[i] = 1.0f;
    }
    cudaMemcpy(kernel,cpuKernel,r*s*C*N*sizeof(float),cudaMemcpyHostToDevice);
    free(cpuKernel);
}
float * Conv::forward(float *input) {
    cudaMemset(output, 0, B*N*hOut*wOut*sizeof(float));
    checkCUDNN(cudnnConvolutionForward(convCudnn,
                                       &alpha,
                                       convInputDescriptor,
                                       input,
                                       convKernelDescriptor,
                                       kernel,
                                       convDesc,
                                       CUDNN_CONVOLUTION_FWD_ALGO_IMPLICIT_GEMM,
                                       d_workspace,
                                       workspace_bytes,
                                       &beta,
                                       convOutputDescriptor,
                                       output));
    return output;
}
__device__ void load_data_2_register(float *__restrict__ data_array, unsigned int c_index, const float * __restrict__ kernel, unsigned int n_id){
    for(unsigned int r=0;r<R;++r){
        for(unsigned int s=0;s<S;++s){
            data_array[r*S+s] = kernel[c_index*N2*9+r*3*N2+s*N2+n_id];
        }
    }
}
__device__ void switch_function( unsigned int switch_condition,float *temp_kernel,float v,float *temp_result){
	switch (switch_condition) {
		case 0:
			for ( int r = 0; r < 1; r++) {
				for ( int s = 0; s < 1; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(0-r)*2+(0-s)] += result;
				}
			}
		break;
		case 1:
			for ( int r = 0; r < 1; r++) {
				for ( int s = 0; s < 2; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(0-r)*2+(1-s)] += result;
				}
			}
		break;
		case 2:
			for ( int r = 0; r < 1; r++) {
				for ( int s = 1; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(0-r)*2+(2-s)] += result;
				}
			}
		break;
		case 3:
			for ( int r = 0; r < 1; r++) {
				for ( int s = 2; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(0-r)*2+(3-s)] += result;
				}
			}
		break;
		case 4:
			for ( int r = 0; r < 2; r++) {
				for ( int s = 0; s < 1; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(1-r)*2+(0-s)] += result;
				}
			}
		break;
		case 5:
			for ( int r = 0; r < 2; r++) {
				for ( int s = 0; s < 2; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(1-r)*2+(1-s)] += result;
				}
			}
		break;
		case 6:
			for ( int r = 0; r < 2; r++) {
				for ( int s = 1; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(1-r)*2+(2-s)] += result;
				}
			}
		break;
		case 7:
			for ( int r = 0; r < 2; r++) {
				for ( int s = 2; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(1-r)*2+(3-s)] += result;
				}
			}
		break;
		case 8:
			for ( int r = 0; r < 3; r++) {
				for ( int s = 0; s < 1; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(2-r)*2+(0-s)] += result;
				}
			}
		break;
		case 9:
			for ( int r = 0; r < 3; r++) {
				for ( int s = 0; s < 2; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(2-r)*2+(1-s)] += result;
				}
			}
		break;
		case 10:
			for ( int r = 0; r < 3; r++) {
				for ( int s = 1; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(2-r)*2+(2-s)] += result;
				}
			}
		break;
		case 11:
			for ( int r = 0; r < 3; r++) {
				for ( int s = 2; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(2-r)*2+(3-s)] += result;
				}
			}
		break;
		case 12:
			for ( int r = 1; r < 3; r++) {
				for ( int s = 0; s < 1; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(3-r)*2+(0-s)] += result;
				}
			}
		break;
		case 13:
			for ( int r = 1; r < 3; r++) {
				for ( int s = 0; s < 2; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(3-r)*2+(1-s)] += result;
				}
			}
		break;
		case 14:
			for ( int r = 1; r < 3; r++) {
				for ( int s = 1; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(3-r)*2+(2-s)] += result;
				}
			}
		break;
		case 15:
			for ( int r = 1; r < 3; r++) {
				for ( int s = 2; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(3-r)*2+(3-s)] += result;
				}
			}
		break;
		case 16:
			for ( int r = 2; r < 3; r++) {
				for ( int s = 0; s < 1; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(4-r)*2+(0-s)] += result;
				}
			}
		break;
		case 17:
			for ( int r = 2; r < 3; r++) {
				for ( int s = 0; s < 2; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(4-r)*2+(1-s)] += result;
				}
			}
		break;
		case 18:
			for ( int r = 2; r < 3; r++) {
				for ( int s = 1; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(4-r)*2+(2-s)] += result;
				}
			}
		break;
		case 19:
			for ( int r = 2; r < 3; r++) {
				for ( int s = 2; s < 3; s++) {
					float result = v * temp_kernel[r*S+s];
					temp_result[(4-r)*2+(3-s)] += result;
				}
			}
		break;

	}
}
__global__ void transform(float *matrix, float *matrix2){
    for(unsigned int global_id = blockIdx.x * blockDim.x + threadIdx.x;global_id<N1*Height*Width;global_id+=gridDim.x * blockDim.x){
        const float v = matrix[global_id];
        unsigned int c = global_id % N1;
        unsigned int hw = global_id / N1;
        int h = (hw)/Width+1;
        int w = (hw)%Width+1;
        int th_start = min(h/TH,THS-1);
        int tw_start = min(w/TW,TWS-1);
        for(int tile_h_id = th_start;tile_h_id>=0;tile_h_id--){
            if((tile_h_id*TH+TH+2)<=h){
                break;
            }
            for(int tile_w_id = tw_start;tile_w_id>=0;tile_w_id--){
                if((tile_w_id*TW+TW+2)<=w){
                    break;
                }
                unsigned int tile_id = tile_h_id * TWS + tile_w_id;
                unsigned int abs_h = h - tile_h_id*TH;
                unsigned int abs_w = w - tile_w_id*TW;
                matrix2[c*THS*TWS*(TH+2)*(TW+2)+tile_id*(TH+2)*(TW+2)+abs_h*(TW+2)+abs_w] = v;
            }
        }
    }

}
__device__ void load_input_2_shared_memory(float *values,float *shared_input,unsigned int warp_id,unsigned int lane_id,
                                           unsigned int tile_id,unsigned int tile_c_id){
    for(unsigned int c_id=warp_id;c_id<TC&&tile_c_id+c_id<N1;c_id+=blockDim.x/32){
        for(unsigned int id = lane_id;id<(TH+2)*(TW+2);id+=32){
            shared_input[c_id*(TH+2)*(TW+2)+id] = values[(tile_c_id+c_id)*(THS*TWS)*(TH+2)*(TW+2)+tile_id*(TH+2)*(TW+2)+id];
        }
    }
}
__global__ void conv2d(float * __restrict__ values,const float * __restrict__ kernel, float * __restrict__ outputs){
    __shared__ float input[TC*(TH+2)*(TW+2)];
    const unsigned int tile_id = blockIdx.x;
    const unsigned int tc_id = tile_id / (THS * TWS);
    const unsigned int th_id = (tile_id - tc_id * (THS*TWS))/TWS;
    const unsigned int tw_id = (tile_id - tc_id * (THS*TWS))%TWS;
    const unsigned int h_start = th_id * TH;
    const unsigned int w_start = tw_id * TW;
    const unsigned int warp_id = threadIdx.x / 32;
    const unsigned int lane_id = threadIdx.x % 32;
    float data_array[9];
    float temp_result[TH*TW] = {0.0f};
    load_input_2_shared_memory(values,input,warp_id,lane_id,tile_id - tc_id * (THS*TWS),tc_id*TC);
    __syncthreads();
    float v;
    unsigned int n = threadIdx.x;
    for(unsigned int c=tc_id*TC;c<tc_id*TC+TC;c++){
        load_data_2_register(data_array,c,kernel,n);
        unsigned int abs_c = c - tc_id * TC;
        for(unsigned int i=0;i<(TH+2)*(TW+2);++i){
            v = input[i + abs_c*(TH+2)*(TW+2)];
            if(v == 0.0f){
                continue;
            }
            switch_function(i,data_array,v,temp_result);
        }
    }
    for (unsigned int th = 0; th < TH; ++th) {
        for (unsigned int tw = 0; tw < TW; ++tw) {
            if (h_start + th >= Height || w_start + tw >= Width) {
                continue;
            }
            atomicAdd(&outputs[(h_start + th) * Width * N2 + (w_start + tw) * N2 +n],temp_result[(th * TW + tw)]);
        }
    }
}
float check_diff(float *x, float *y, unsigned int size){
    float diff = 0.0f;
    for(unsigned int i=0;i<size;++i){
        diff += abs(x[i] - y[i]);
    }
    return diff;
}
int main(void){
    float *input = new float[N1*Height*Width];
    time_t t;
    srand((unsigned) time(&t));
    for(int i =0;i<N1*Height*Width;++i){
        input[i] = rand() % 10;
    }
    float *device_input;
    cudaMalloc(&device_input,N1*Height*Width*sizeof(float));
    cudaMemcpy(device_input,input,N1*Height*Width*sizeof(float),cudaMemcpyHostToDevice);
    float *K2 = new float[N1*N2*9];
    for(int i=0;i<N1*N2*9;++i){
        K2[i] = 1.0f;
    }
    cudaEvent_t event_start;
    cudaEvent_t event_stop;
    cudaEventCreate(&event_start);
    cudaEventCreate(&event_stop);
    float *device_K2;
    float *device_out;
    cudaMalloc(&device_out,Height*Width*N2*sizeof(float));
    cudaMemset(device_out,0,Height*Width*N2*sizeof(float));
    cudaMalloc(&device_K2,N1*N2*9*sizeof(float));
    cudaMemcpy(device_K2,K2,N1*N2*9*sizeof(float),cudaMemcpyHostToDevice);
    float *matrix;
    cudaMalloc(&matrix,N1*(TH+2)*(TW+2)*THS*TWS*sizeof(float));

    cudaEventRecord(event_start);
    cudaMemset(matrix,0,N1*(TH+2)*(TW+2)*THS*TWS*sizeof(float));
    transform<<<108,512>>>(device_input,matrix);
    conv2d<<<TCS*THS*TWS,N2>>>(matrix,device_K2, device_out);
    cudaEventRecord(event_stop);
    cudaEventSynchronize(event_stop);
    float time3;
    cudaEventElapsedTime(&time3, event_start, event_stop);
    cout<<N2<<","<<N1<<","<<Height<<","<<Width<<","<<TH<<","<<TW<<","<<TC<<","<<time3<<endl;
    return 0;
}

