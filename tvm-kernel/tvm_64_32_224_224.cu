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
  float compute_local[32];
  __shared__ float pad_temp_shared[3072];
  __shared__ float kernel_shared[1536];
  float pad_temp_shared_local[64];
  float kernel_shared_local[2];
  for (int yy_c_init = 0; yy_c_init < 2; ++yy_c_init) {
    for (int xx_c_init = 0; xx_c_init < 8; ++xx_c_init) {
      compute_local[(((yy_c_init * 8) + xx_c_init))] = 0.000000e+00f;
      compute_local[((((yy_c_init * 8) + xx_c_init) + 16))] = 0.000000e+00f;
    }
  }
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    for (int rx_outer = 0; rx_outer < 3; ++rx_outer) {
      __syncthreads();
      for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 24; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
        pad_temp_shared[(((((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 48)) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((1 <= ((((int)blockIdx.y) * 4) + (((((int)threadIdx.z) * 3) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) >> 5)) % 6))) && (((((int)blockIdx.y) * 4) + (((((int)threadIdx.z) * 3) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) >> 5)) % 6)) < 225)) && (1 <= (((((int)blockIdx.x) * 32) + rx_outer) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 31)))) && ((((((int)blockIdx.x) * 32) + rx_outer) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 31)) < 225)) ? data[(((((((((rc_outer * 802816) + ((((((int)threadIdx.z) * 3) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) >> 5)) / 6) * 50176)) + (((int)blockIdx.y) * 896)) + ((((((int)threadIdx.z) * 3) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) >> 5)) % 6) * 224)) + (((int)blockIdx.x) * 32)) + rx_outer) + ((((((int)threadIdx.y) * 48) + (((int)threadIdx.x) * 24)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) & 31)) - 225))] : 0.000000e+00f);
      }
      for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 12; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
        kernel_shared[(((((((int)threadIdx.z) * 48) + (((int)threadIdx.y) * 24)) + (((int)threadIdx.x) * 12)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = kernel[(((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + (((int)threadIdx.y) * 72)) + (((int)threadIdx.x) * 36)) + (ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 * 3)) + rx_outer))];
      }
      __syncthreads();
      for (int rc_inner_outer = 0; rc_inner_outer < 8; ++rc_inner_outer) {
        for (int ry_inner_outer = 0; ry_inner_outer < 3; ++ry_inner_outer) {
          for (int ax1 = 0; ax1 < 2; ++ax1) {
            for (int ax2 = 0; ax2 < 2; ++ax2) {
              for (int ax3 = 0; ax3 < 8; ++ax3) {
                pad_temp_shared_local[((((ax1 * 16) + (ax2 * 8)) + ax3))] = pad_temp_shared[((((((((rc_inner_outer * 384) + (ax1 * 192)) + (((int)threadIdx.y) * 64)) + (ax2 * 32)) + (ry_inner_outer * 32)) + (((int)threadIdx.x) * 8)) + ax3))];
                pad_temp_shared_local[(((((ax1 * 16) + (ax2 * 8)) + ax3) + 32))] = pad_temp_shared[(((((((((rc_inner_outer * 384) + (ax1 * 192)) + (((int)threadIdx.y) * 64)) + (ax2 * 32)) + (ry_inner_outer * 32)) + (((int)threadIdx.x) * 8)) + ax3) + 16))];
              }
            }
          }
          for (int ax11 = 0; ax11 < 2; ++ax11) {
            kernel_shared_local[(ax11)] = kernel_shared[(((((((int)threadIdx.z) * 48) + (rc_inner_outer * 6)) + (ax11 * 3)) + ry_inner_outer))];
          }
          for (int rc_inner_inner = 0; rc_inner_inner < 2; ++rc_inner_inner) {
            for (int yy_c = 0; yy_c < 2; ++yy_c) {
              for (int xx_c = 0; xx_c < 8; ++xx_c) {
                compute_local[(((yy_c * 8) + xx_c))] = (compute_local[(((yy_c * 8) + xx_c))] + (pad_temp_shared_local[((((rc_inner_inner * 16) + (yy_c * 8)) + xx_c))] * kernel_shared_local[(rc_inner_inner)]));
                compute_local[((((yy_c * 8) + xx_c) + 16))] = (compute_local[((((yy_c * 8) + xx_c) + 16))] + (pad_temp_shared_local[(((((rc_inner_inner * 16) + (yy_c * 8)) + xx_c) + 32))] * kernel_shared_local[(rc_inner_inner)]));
              }
            }
          }
        }
      }
    }
  }
  for (int yy_inner_inner_inner = 0; yy_inner_inner_inner < 2; ++yy_inner_inner_inner) {
    for (int xx_inner_inner_inner = 0; xx_inner_inner_inner < 8; ++xx_inner_inner_inner) {
      compute[((((((((((int)threadIdx.z) * 50176) + (((int)blockIdx.y) * 896)) + (((int)threadIdx.y) * 448)) + (yy_inner_inner_inner * 224)) + (((int)blockIdx.x) * 32)) + (((int)threadIdx.x) * 8)) + xx_inner_inner_inner))] = compute_local[(((yy_inner_inner_inner * 8) + xx_inner_inner_inner))];
      compute[(((((((((((int)threadIdx.z) * 50176) + (((int)blockIdx.y) * 896)) + (((int)threadIdx.y) * 448)) + (yy_inner_inner_inner * 224)) + (((int)blockIdx.x) * 32)) + (((int)threadIdx.x) * 8)) + xx_inner_inner_inner) + 16))] = compute_local[((((yy_inner_inner_inner * 8) + xx_inner_inner_inner) + 16))];
    }
  }
}

int main(int argc, char *argv[]){
    dim3 grid(7,56,1);
    dim3 block(2,2,32);
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
