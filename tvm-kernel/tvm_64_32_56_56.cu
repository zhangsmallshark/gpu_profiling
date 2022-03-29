//
// Created by lizhi on 3/24/22.
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
  float compute_local[16];
  __shared__ float pad_temp_shared[200];
  __shared__ float kernel_shared[288];
  float pad_temp_shared_local[8];
  float kernel_shared_local[12];
  #pragma unroll
  for (int ff_c_init = 0; ff_c_init < 2; ++ff_c_init) {
    #pragma unroll
    for (int xx_c_init = 0; xx_c_init < 2; ++xx_c_init) {
      compute_local[(((ff_c_init * 2) + xx_c_init))] = 0.000000e+00f;
      compute_local[((((ff_c_init * 2) + xx_c_init) + 8))] = 0.000000e+00f;
      compute_local[((((ff_c_init * 2) + xx_c_init) + 4))] = 0.000000e+00f;
      compute_local[((((ff_c_init * 2) + xx_c_init) + 12))] = 0.000000e+00f;
    }
  }
  for (int rc_outer = 0; rc_outer < 32; ++rc_outer) {
    __syncthreads();
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 4; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      if (((((int)threadIdx.z) * 5) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) < 20) {
        if (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 7)) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 200) {
          if ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 50) {
            if (((((int)threadIdx.x) * 4) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 7) {
              pad_temp_shared[(((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 7)) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((1 <= ((((int)blockIdx.y) * 8) + (((((int)threadIdx.z) * 5) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10))) && (((((int)blockIdx.y) * 8) + (((((int)threadIdx.z) * 5) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10)) < 57)) && (1 <= ((((int)blockIdx.x) * 8) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)))) && (((((int)blockIdx.x) * 8) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)) < 57)) ? data[((((((((rc_outer * 6272) + ((((((int)threadIdx.z) * 5) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) / 10) * 3136)) + (((int)blockIdx.y) * 448)) + ((((((int)threadIdx.z) * 5) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10) * 56)) + (((int)blockIdx.x) * 8)) + ((((((int)threadIdx.y) * 7) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)) - 57))] : 0.000000e+00f);
            }
          }
        }
      }
    }
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 5; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
      if (((((int)threadIdx.z) * 4) + (((((((int)threadIdx.x) * 5) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 9) + ((int)threadIdx.y)) >> 1)) < 16) {
        if ((((((int)threadIdx.z) * 8) + (((((int)threadIdx.x) * 5) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 9)) + ((int)threadIdx.y)) < 32) {
          if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 3)) + (((((int)threadIdx.x) * 5) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 3)) < 96) {
            if (((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 9)) + (((int)threadIdx.x) * 5)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 288) {
              if ((((((int)threadIdx.y) * 9) + (((int)threadIdx.x) * 5)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 72) {
                if (((((int)threadIdx.x) * 5) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 9) {
                  kernel_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 9)) + (((int)threadIdx.x) * 5)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = kernel[((((((((((int)blockIdx.z) * 9216) + (((int)threadIdx.z) * 2304)) + ((((int)threadIdx.y) >> 1) * 576)) + (rc_outer * 18)) + ((((int)threadIdx.y) & 1) * 9)) + (((int)threadIdx.x) * 5)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))];
                }
              }
            }
          }
        }
      }
    }
    __syncthreads();
    #pragma unroll
    for (int rc_inner_outer = 0; rc_inner_outer < 2; ++rc_inner_outer) {
      #pragma unroll
      for (int ry_inner_outer = 0; ry_inner_outer < 3; ++ry_inner_outer) {
        #pragma unroll
        for (int ax3 = 0; ax3 < 4; ++ax3) {
          pad_temp_shared_local[(ax3)] = pad_temp_shared[((((((rc_inner_outer * 100) + (((int)threadIdx.y) * 10)) + (ry_inner_outer * 10)) + (((int)threadIdx.x) * 2)) + ax3))];
          pad_temp_shared_local[((ax3 + 4))] = pad_temp_shared[(((((((rc_inner_outer * 100) + (((int)threadIdx.y) * 10)) + (ry_inner_outer * 10)) + (((int)threadIdx.x) * 2)) + ax3) + 4))];
        }
        #pragma unroll
        for (int ax0 = 0; ax0 < 2; ++ax0) {
          #pragma unroll
          for (int ax31 = 0; ax31 < 3; ++ax31) {
            kernel_shared_local[(((ax0 * 3) + ax31))] = kernel_shared[((((((((int)threadIdx.z) * 36) + (ax0 * 18)) + (rc_inner_outer * 9)) + (ry_inner_outer * 3)) + ax31))];
            kernel_shared_local[((((ax0 * 3) + ax31) + 6))] = kernel_shared[(((((((((int)threadIdx.z) * 36) + (ax0 * 18)) + (rc_inner_outer * 9)) + (ry_inner_outer * 3)) + ax31) + 144))];
          }
        }
        #pragma unroll
        for (int rx_inner_inner = 0; rx_inner_inner < 3; ++rx_inner_inner) {
          #pragma unroll
          for (int ff_c = 0; ff_c < 2; ++ff_c) {
            #pragma unroll
            for (int xx_c = 0; xx_c < 2; ++xx_c) {
              compute_local[(((ff_c * 2) + xx_c))] = (compute_local[(((ff_c * 2) + xx_c))] + (pad_temp_shared_local[((xx_c + rx_inner_inner))] * kernel_shared_local[(((ff_c * 3) + rx_inner_inner))]));
              compute_local[((((ff_c * 2) + xx_c) + 8))] = (compute_local[((((ff_c * 2) + xx_c) + 8))] + (pad_temp_shared_local[((xx_c + rx_inner_inner))] * kernel_shared_local[((((ff_c * 3) + rx_inner_inner) + 6))]));
              compute_local[((((ff_c * 2) + xx_c) + 4))] = (compute_local[((((ff_c * 2) + xx_c) + 4))] + (pad_temp_shared_local[(((xx_c + rx_inner_inner) + 4))] * kernel_shared_local[(((ff_c * 3) + rx_inner_inner))]));
              compute_local[((((ff_c * 2) + xx_c) + 12))] = (compute_local[((((ff_c * 2) + xx_c) + 12))] + (pad_temp_shared_local[(((xx_c + rx_inner_inner) + 4))] * kernel_shared_local[((((ff_c * 3) + rx_inner_inner) + 6))]));
            }
          }
        }
      }
    }
  }
  #pragma unroll
  for (int ff_inner_inner_inner = 0; ff_inner_inner_inner < 2; ++ff_inner_inner_inner) {
    #pragma unroll
    for (int xx_inner_inner_inner = 0; xx_inner_inner_inner < 2; ++xx_inner_inner_inner) {
      compute[(((((((((((int)blockIdx.z) * 50176) + (((int)threadIdx.z) * 6272)) + (ff_inner_inner_inner * 3136)) + (((int)blockIdx.y) * 448)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner))] = compute_local[(((ff_inner_inner_inner * 2) + xx_inner_inner_inner))];
      compute[((((((((((((int)blockIdx.z) * 50176) + (((int)threadIdx.z) * 6272)) + (ff_inner_inner_inner * 3136)) + (((int)blockIdx.y) * 448)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner) + 25088))] = compute_local[((((ff_inner_inner_inner * 2) + xx_inner_inner_inner) + 8))];
      compute[((((((((((((int)blockIdx.z) * 50176) + (((int)threadIdx.z) * 6272)) + (ff_inner_inner_inner * 3136)) + (((int)blockIdx.y) * 448)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner) + 4))] = compute_local[((((ff_inner_inner_inner * 2) + xx_inner_inner_inner) + 4))];
      compute[((((((((((((int)blockIdx.z) * 50176) + (((int)threadIdx.z) * 6272)) + (ff_inner_inner_inner * 3136)) + (((int)blockIdx.y) * 448)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner) + 25092))] = compute_local[((((ff_inner_inner_inner * 2) + xx_inner_inner_inner) + 12))];
    }
  }
}

//grid=(56,56,32),  block=(1,1,1)
int main(int argc, char *argv[]){
    dim3 grid(7,7,2);
    dim3 block(2,8,4);
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
