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
  float compute_local[28];
  __shared__ float pad_temp_shared[224];
  __shared__ float kernel_shared[192];
  float pad_temp_shared_local[42];
  float kernel_shared_local[24];
  #pragma unroll
  for (int ff_c_init = 0; ff_c_init < 4; ++ff_c_init) {
    #pragma unroll
    for (int yy_c_init = 0; yy_c_init < 7; ++yy_c_init) {
      compute_local[(((ff_c_init * 7) + yy_c_init))] = 0.000000e+00f;
    }
  }
  for (int rc_outer = 0; rc_outer < 96; ++rc_outer) {
    #pragma unroll
    for (int ry_outer = 0; ry_outer < 3; ++ry_outer) {
      __syncthreads();
      #pragma unroll
      for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 2; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
        pad_temp_shared[((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((1 <= (((((int)blockIdx.y) * 7) + (((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 112) >> 4)) + ry_outer)) && ((((((int)blockIdx.y) * 7) + (((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 112) >> 4)) + ry_outer) < 15)) && (1 <= ((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 15))) && (((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 15) < 15)) ? data[((((((((rc_outer * 392) + (((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 112) * 196)) + (((int)blockIdx.y) * 98)) + ((((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 112) >> 4) * 14)) + (ry_outer * 14)) + ((((((int)threadIdx.z) * 28) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 15)) - 15))] : 0.000000e+00f);
      }
      #pragma unroll
      for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 2; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
        if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 6)) < 32) {
          if (((((int)threadIdx.z) * 8) + (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 3)) < 64) {
            if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 192) {
              if (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 24) {
                kernel_shared[((((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = kernel[((((((((((int)blockIdx.z) * 55296) + (((int)threadIdx.z) * 6912)) + ((((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) / 6) * 1728)) + (rc_outer * 18)) + (((((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) % 6) / 3) * 9)) + (ry_outer * 3)) + (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) % 3)))];
              }
            }
          }
        }
      }
      __syncthreads();
      #pragma unroll
      for (int ax1 = 0; ax1 < 2; ++ax1) {
        #pragma unroll
        for (int ax2 = 0; ax2 < 7; ++ax2) {
          #pragma unroll
          for (int ax3 = 0; ax3 < 3; ++ax3) {
            pad_temp_shared_local[((((ax1 * 21) + (ax2 * 3)) + ax3))] = pad_temp_shared[(((((ax1 * 112) + (ax2 * 16)) + ax3) + ((int)threadIdx.x)))];
          }
        }
      }
      #pragma unroll
      for (int ax0 = 0; ax0 < 4; ++ax0) {
        #pragma unroll
        for (int ax11 = 0; ax11 < 2; ++ax11) {
          #pragma unroll
          for (int ax31 = 0; ax31 < 3; ++ax31) {
            kernel_shared_local[((((ax0 * 6) + (ax11 * 3)) + ax31))] = kernel_shared[(((((((int)threadIdx.z) * 24) + (ax0 * 6)) + (ax11 * 3)) + ax31))];
          }
        }
      }
      #pragma unroll
      for (int rc_inner_inner = 0; rc_inner_inner < 2; ++rc_inner_inner) {
        #pragma unroll
        for (int rx_inner_inner = 0; rx_inner_inner < 3; ++rx_inner_inner) {
          #pragma unroll
          for (int ff_c = 0; ff_c < 4; ++ff_c) {
            #pragma unroll
            for (int yy_c = 0; yy_c < 7; ++yy_c) {
              compute_local[(((ff_c * 7) + yy_c))] = (compute_local[(((ff_c * 7) + yy_c))] + (pad_temp_shared_local[((((rc_inner_inner * 21) + (yy_c * 3)) + rx_inner_inner))] * kernel_shared_local[((((ff_c * 6) + (rc_inner_inner * 3)) + rx_inner_inner))]));
            }
          }
        }
      }
    }
  }
  #pragma unroll
  for (int ff_inner_inner_inner = 0; ff_inner_inner_inner < 4; ++ff_inner_inner_inner) {
    #pragma unroll
    for (int yy_inner_inner_inner = 0; yy_inner_inner_inner < 7; ++yy_inner_inner_inner) {
      compute[(((((((((int)blockIdx.z) * 6272) + (((int)threadIdx.z) * 784)) + (ff_inner_inner_inner * 196)) + (((int)blockIdx.y) * 98)) + (yy_inner_inner_inner * 14)) + ((int)threadIdx.x)))] = compute_local[(((ff_inner_inner_inner * 7) + yy_inner_inner_inner))];
    }
  }
}


int main(int argc, char *argv[]){
    dim3 grid(1,2,3);
    dim3 block(14,1,8);
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
