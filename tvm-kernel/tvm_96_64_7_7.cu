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
//grid=(1,7,16),  block=(7,1,2)
extern "C" __global__ void default_function_kernel0(float* __restrict__ data, float* __restrict__ kernel, float* __restrict__ compute) {
  float compute_local[4];
  __shared__ float pad_temp_shared[2592];
  __shared__ float kernel_shared[4608];
  float pad_temp_shared_local[48];
  float kernel_shared_local[192];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  compute_local[(2)] = 0.000000e+00f;
  compute_local[(3)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 3; ++rc_outer) {
    __syncthreads();
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 14; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      if (((((int)threadIdx.z) * 8) + ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 81)) < 32) {
        if (((((int)threadIdx.z) * 72) + ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 9)) < 288) {
          if (((((((int)threadIdx.z) * 648) + (((int)threadIdx.y) * 93)) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 2592) {
            if ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 648) {
              if (((((int)threadIdx.x) * 14) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 93) {
                pad_temp_shared[(((((((int)threadIdx.z) * 648) + (((int)threadIdx.y) * 93)) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((9 <= ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 81)) && (((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 81) < 72)) && (1 <= ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 9))) && (((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 9) < 8)) ? data[(((((((rc_outer * 1568) + (((int)threadIdx.z) * 392)) + (((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 81) * 49)) + ((((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 81) / 9) * 7)) + ((((((int)threadIdx.y) * 93) + (((int)threadIdx.x) * 14)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 9)) - 8))] : 0.000000e+00f);
              }
            }
          }
        }
      }
    }
    #pragma unroll
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 24; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
      if (((((int)threadIdx.z) * 4) + ((((((int)threadIdx.y) * 55) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) / 96)) < 16) {
        if (((((int)threadIdx.z) * 128) + ((((((int)threadIdx.y) * 55) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) / 3)) < 512) {
          if (((((((int)threadIdx.z) * 384) + (((int)threadIdx.y) * 55)) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) < 1536) {
            if (((((((int)threadIdx.z) * 1152) + (((int)threadIdx.y) * 165)) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 4608) {
              if ((((((int)threadIdx.y) * 165) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 1152) {
                if (((((int)threadIdx.x) * 24) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) < 165) {
                  if ((((((int)blockIdx.z) * 16) + (((int)threadIdx.z) * 4)) + ((((((int)threadIdx.y) * 55) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) / 96)) < 64) {
                    kernel_shared[(((((((int)threadIdx.z) * 1152) + (((int)threadIdx.y) * 165)) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = kernel[(((((((((int)blockIdx.z) * 13824) + (((int)threadIdx.z) * 3456)) + (((((((int)threadIdx.y) * 55) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) / 96) * 864)) + (rc_outer * 288)) + (((((((int)threadIdx.y) * 55) + (((int)threadIdx.x) * 8)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 / 3)) % 96) * 3)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 % 3)))];
                  }
                }
              }
            }
          }
        }
      }
    }
    __syncthreads();
    for (int rc_inner_outer = 0; rc_inner_outer < 2; ++rc_inner_outer) {
      for (int rx_inner_outer = 0; rx_inner_outer < 3; ++rx_inner_outer) {
        #pragma unroll
        for (int ax1 = 0; ax1 < 16; ++ax1) {
          #pragma unroll
          for (int ax2 = 0; ax2 < 3; ++ax2) {
            pad_temp_shared_local[(((ax1 * 3) + ax2))] = pad_temp_shared[(((((((rc_inner_outer * 1296) + (ax1 * 81)) + (ax2 * 9)) + (((int)threadIdx.y) * 9)) + ((int)threadIdx.x)) + rx_inner_outer))];
          }
        }
        #pragma unroll
        for (int ax11 = 0; ax11 < 16; ++ax11) {
          #pragma unroll
          for (int ax21 = 0; ax21 < 3; ++ax21) {
            kernel_shared_local[(((ax11 * 3) + ax21))] = kernel_shared[((((((((int)threadIdx.z) * 288) + (rc_inner_outer * 144)) + (ax11 * 9)) + (ax21 * 3)) + rx_inner_outer))];
            kernel_shared_local[((((ax11 * 3) + ax21) + 48))] = kernel_shared[(((((((((int)threadIdx.z) * 288) + (rc_inner_outer * 144)) + (ax11 * 9)) + (ax21 * 3)) + rx_inner_outer) + 1152))];
            kernel_shared_local[((((ax11 * 3) + ax21) + 96))] = kernel_shared[(((((((((int)threadIdx.z) * 288) + (rc_inner_outer * 144)) + (ax11 * 9)) + (ax21 * 3)) + rx_inner_outer) + 2304))];
            kernel_shared_local[((((ax11 * 3) + ax21) + 144))] = kernel_shared[(((((((((int)threadIdx.z) * 288) + (rc_inner_outer * 144)) + (ax11 * 9)) + (ax21 * 3)) + rx_inner_outer) + 3456))];
          }
        }
        #pragma unroll
        for (int rc_inner_inner = 0; rc_inner_inner < 16; ++rc_inner_inner) {
          #pragma unroll
          for (int ry_inner_inner = 0; ry_inner_inner < 3; ++ry_inner_inner) {
            compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(((rc_inner_inner * 3) + ry_inner_inner))] * kernel_shared_local[(((rc_inner_inner * 3) + ry_inner_inner))]));
            compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(((rc_inner_inner * 3) + ry_inner_inner))] * kernel_shared_local[((((rc_inner_inner * 3) + ry_inner_inner) + 48))]));
            compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(((rc_inner_inner * 3) + ry_inner_inner))] * kernel_shared_local[((((rc_inner_inner * 3) + ry_inner_inner) + 96))]));
            compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(((rc_inner_inner * 3) + ry_inner_inner))] * kernel_shared_local[((((rc_inner_inner * 3) + ry_inner_inner) + 144))]));
          }
        }
      }
    }
  }
  compute[(((((((int)blockIdx.z) * 784) + (((int)threadIdx.z) * 49)) + (((int)threadIdx.y) * 7)) + ((int)threadIdx.x)))] = compute_local[(0)];
  compute[((((((((int)blockIdx.z) * 784) + (((int)threadIdx.z) * 49)) + (((int)threadIdx.y) * 7)) + ((int)threadIdx.x)) + 196))] = compute_local[(1)];
  compute[((((((((int)blockIdx.z) * 784) + (((int)threadIdx.z) * 49)) + (((int)threadIdx.y) * 7)) + ((int)threadIdx.x)) + 392))] = compute_local[(2)];
  compute[((((((((int)blockIdx.z) * 784) + (((int)threadIdx.z) * 49)) + (((int)threadIdx.y) * 7)) + ((int)threadIdx.x)) + 588))] = compute_local[(3)];
}

int main(int argc, char *argv[]){
    dim3 grid(1,1,4);
    dim3 block(7,7,4);
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
