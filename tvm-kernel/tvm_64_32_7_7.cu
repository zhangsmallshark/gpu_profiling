//

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
using namespace std;
extern "C" __global__ void default_function_kernel0(float* __restrict__ data, float* __restrict__ kernel, float* __restrict__ compute) {
  float compute_local[1];
  __shared__ float pad_temp_shared[1];
  __shared__ float kernel_shared[1];
  float pad_temp_shared_local[1];
  float kernel_shared_local[1];
  compute_local[(0)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 64; ++rc_outer) {
    for (int ry_outer = 0; ry_outer < 3; ++ry_outer) {
      for (int rx_outer = 0; rx_outer < 3; ++rx_outer) {
        pad_temp_shared[(0)] = (((((1 <= (((int)blockIdx.y) + ry_outer)) && ((((int)blockIdx.y) + ry_outer) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 49) + (((int)blockIdx.y) * 7)) + (ry_outer * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        kernel_shared[(0)] = kernel[(((((((int)blockIdx.z) * 576) + (rc_outer * 9)) + (ry_outer * 3)) + rx_outer))];
        pad_temp_shared_local[(0)] = pad_temp_shared[(0)];
        kernel_shared_local[(0)] = kernel_shared[(0)];
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      }
    }
  }
  compute[((((((int)blockIdx.z) * 49) + (((int)blockIdx.y) * 7)) + ((int)blockIdx.x)))] = compute_local[(0)];
}

//grid=(1,1,2),  block=(7,7,4)
int main(int argc, char *argv[]){
    dim3 grid(7,7,32);
    dim3 block(1,1,1);
    int C = atoi(argv[1]);
    int H = atoi(argv[3]);
    int W = atoi(argv[4]);
    int N = atoi(argv[2]);
    int data_size = C*H*W;

    float *input;
    cudaMalloc(&input,data_size*sizeof(float));
    float *weight;
    cudaMalloc(&weight,N*C*9*sizeof(float));
    float *output;
    cudaMalloc(&output,N*H*W*sizeof(float));

    cudaDeviceSynchronize();
    float inference_time = 0.0f;
    cudaEvent_t event_start;
    cudaEvent_t event_stop;
    cudaEventCreate(&event_start);
    cudaEventCreate(&event_stop);
    for(int i=0;i<1024;++i){
        cudaEventRecord(event_start);
        default_function_kernel0<<<grid,block>>>(input,weight,output);
        cudaEventRecord(event_stop);
        cudaEventSynchronize(event_stop);
        float temp_time;
        cudaEventElapsedTime(&temp_time, event_start, event_stop);
        inference_time += temp_time;
    }
    cout<<C<<","<<N<<","<<H<<","<<W<<","<<inference_time/1024<<endl;
    return 0;
}
