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
  float compute_local[8];
  __shared__ float pad_temp_shared[1600];
  __shared__ float kernel_shared[2304];
  float pad_temp_shared_local[64];
  float kernel_shared_local[48];
  #pragma unroll
  for (int ff_c_init = 0; ff_c_init < 2; ++ff_c_init) {
    #pragma unroll
    for (int xx_c_init = 0; xx_c_init < 2; ++xx_c_init) {
      compute_local[(((ff_c_init * 2) + xx_c_init))] = 0.000000e+00f;
      compute_local[((((ff_c_init * 2) + xx_c_init) + 4))] = 0.000000e+00f;
    }
  }
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    __syncthreads();
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 13; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 5) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) / 10)) < 16) {
        if ((((((int)threadIdx.z) * 20) + (((int)threadIdx.y) * 5)) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) < 160) {
          if (((((((int)threadIdx.z) * 200) + (((int)threadIdx.y) * 50)) + (((int)threadIdx.x) * 13)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 1600) {
            if ((((((int)threadIdx.y) * 50) + (((int)threadIdx.x) * 13)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 200) {
              if (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 50) {
                pad_temp_shared[(((((((int)threadIdx.z) * 200) + (((int)threadIdx.y) * 50)) + (((int)threadIdx.x) * 13)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((1 <= ((((int)blockIdx.y) * 8) + (((((int)threadIdx.y) * 5) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10))) && (((((int)blockIdx.y) * 8) + (((((int)threadIdx.y) * 5) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10)) < 113)) && (1 <= ((((int)blockIdx.x) * 8) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)))) && (((((int)blockIdx.x) * 8) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)) < 113)) ? data[(((((((((rc_outer * 200704) + (((int)threadIdx.z) * 25088)) + ((((((int)threadIdx.y) * 5) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) / 10) * 12544)) + (((int)blockIdx.y) * 896)) + ((((((int)threadIdx.y) * 5) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 10)) % 10) * 112)) + (((int)blockIdx.x) * 8)) + (((((int)threadIdx.x) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 10)) - 113))] : 0.000000e+00f);
              }
            }
          }
        }
      }
    }
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 18; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
      kernel_shared[(((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 72)) + (((int)threadIdx.x) * 18)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = kernel[(((((((((int)blockIdx.z) * 9216) + (((int)threadIdx.z) * 1152)) + (((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 9)) >> 4) * 576)) + (rc_outer * 144)) + (((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 9)) & 15) * 9)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 % 9)))];
    }
    __syncthreads();
    for (int rc_inner_outer = 0; rc_inner_outer < 2; ++rc_inner_outer) {
      #pragma unroll
      for (int ry_inner_outer = 0; ry_inner_outer < 3; ++ry_inner_outer) {
        #pragma unroll
        for (int ax1 = 0; ax1 < 8; ++ax1) {
          #pragma unroll
          for (int ax3 = 0; ax3 < 4; ++ax3) {
            pad_temp_shared_local[(((ax1 * 4) + ax3))] = pad_temp_shared[(((((((rc_inner_outer * 800) + (ax1 * 100)) + (((int)threadIdx.y) * 10)) + (ry_inner_outer * 10)) + (((int)threadIdx.x) * 2)) + ax3))];
            pad_temp_shared_local[((((ax1 * 4) + ax3) + 32))] = pad_temp_shared[((((((((rc_inner_outer * 800) + (ax1 * 100)) + (((int)threadIdx.y) * 10)) + (ry_inner_outer * 10)) + (((int)threadIdx.x) * 2)) + ax3) + 40))];
          }
        }
        #pragma unroll
        for (int ax0 = 0; ax0 < 2; ++ax0) {
          #pragma unroll
          for (int ax11 = 0; ax11 < 8; ++ax11) {
            #pragma unroll
            for (int ax31 = 0; ax31 < 3; ++ax31) {
              kernel_shared_local[((((ax0 * 24) + (ax11 * 3)) + ax31))] = kernel_shared[(((((((((int)threadIdx.z) * 288) + (ax0 * 144)) + (rc_inner_outer * 72)) + (ax11 * 9)) + (ry_inner_outer * 3)) + ax31))];
            }
          }
        }
        #pragma unroll
        for (int rc_inner_inner = 0; rc_inner_inner < 8; ++rc_inner_inner) {
          #pragma unroll
          for (int rx_inner_inner = 0; rx_inner_inner < 3; ++rx_inner_inner) {
            #pragma unroll
            for (int ff_c = 0; ff_c < 2; ++ff_c) {
              #pragma unroll
              for (int xx_c = 0; xx_c < 2; ++xx_c) {
                compute_local[(((ff_c * 2) + xx_c))] = (compute_local[(((ff_c * 2) + xx_c))] + (pad_temp_shared_local[((((rc_inner_inner * 4) + xx_c) + rx_inner_inner))] * kernel_shared_local[((((ff_c * 24) + (rc_inner_inner * 3)) + rx_inner_inner))]));
                compute_local[((((ff_c * 2) + xx_c) + 4))] = (compute_local[((((ff_c * 2) + xx_c) + 4))] + (pad_temp_shared_local[(((((rc_inner_inner * 4) + xx_c) + rx_inner_inner) + 32))] * kernel_shared_local[((((ff_c * 24) + (rc_inner_inner * 3)) + rx_inner_inner))]));
              }
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
      compute[(((((((((((int)blockIdx.z) * 200704) + (((int)threadIdx.z) * 25088)) + (ff_inner_inner_inner * 12544)) + (((int)blockIdx.y) * 896)) + (((int)threadIdx.y) * 112)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner))] = compute_local[(((ff_inner_inner_inner * 2) + xx_inner_inner_inner))];
      compute[((((((((((((int)blockIdx.z) * 200704) + (((int)threadIdx.z) * 25088)) + (ff_inner_inner_inner * 12544)) + (((int)blockIdx.y) * 896)) + (((int)threadIdx.y) * 112)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + xx_inner_inner_inner) + 448))] = compute_local[((((ff_inner_inner_inner * 2) + xx_inner_inner_inner) + 4))];
    }
  }
}

//grid=(7,2,8),  block=(2,1,4)
int main(int argc, char *argv[]){
    dim3 grid(14,14,2);
    dim3 block(4,4,8);
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
