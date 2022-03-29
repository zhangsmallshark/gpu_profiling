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
  float compute_local[4];
  __shared__ float pad_temp_shared[768];
  __shared__ float kernel_shared[1728];
  float pad_temp_shared_local[2];
  float kernel_shared_local[8];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  compute_local[(2)] = 0.000000e+00f;
  compute_local[(3)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 10; ++rc_outer) {
    __syncthreads();
    pad_temp_shared[(((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + ((((int)threadIdx.x) * 19) & 15)))) && (((((int)blockIdx.x) * 14) + ((((int)threadIdx.x) * 19) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + ((((int)threadIdx.x) * 19) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 1))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 1) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 1) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 1) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 1) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 1) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 1) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 1) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 2))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 2) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 2) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 2) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 2) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 2) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 2) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 2) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 3))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 3) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 3) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 3) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 3) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 3) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 3) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 3) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 4))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 4) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 4) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 4) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 4) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 4) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 4) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 4) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 5))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 5) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 5) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 5) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 5) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 5) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 5) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 5) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 6))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 6) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 6) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 6) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 6) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 6) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 6) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 6) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 7))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 7) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 7) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 7) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 7) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 7) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 7) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 7) & 15)) - 29))] : 0.000000e+00f);
    pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 8))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 8) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 8) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 8) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 8) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 8) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 8) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 8) & 15)) - 29))] : 0.000000e+00f);
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 9) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 759) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 9))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 9) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 9) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 9) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 9) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 9) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 9) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 9) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 10) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 758) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 10))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 10) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 10) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 10) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 10) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 10) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 10) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 10) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 11) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 757) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 11))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 11) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 11) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 11) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 11) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 11) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 11) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 11) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 12) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 756) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 12))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 12) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 12) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 12) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 12) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 12) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 12) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 12) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 13) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 755) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 13))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 13) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 13) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 13) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 13) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 13) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 13) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 13) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 14) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 754) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 14))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 14) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 14) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 14) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 14) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 14) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 14) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 14) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 15) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 753) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 15))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 15) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 15) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 15) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 15) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 15) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 15) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 15) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) < 47) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 752) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 16))] = (((((1 <= (((int)blockIdx.y) + ((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) + 1) % 3))) && ((((int)blockIdx.y) + ((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) + 1) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + ((((int)threadIdx.x) * 19) & 15)))) && (((((int)blockIdx.x) * 14) + ((((int)threadIdx.x) * 19) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + (((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) + 1) / 3) * 784)) + (((int)blockIdx.y) * 28)) + (((((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 19) >> 4)) + 1) % 3) * 28)) + (((int)blockIdx.x) * 14)) + ((((int)threadIdx.x) * 19) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 17) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 751) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 17))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 17) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 17) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 1) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 1) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 17) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 17) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 1) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 18) >> 4)) < 48) {
      if (((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) < 750) {
        if (((int)threadIdx.x) < 13) {
          pad_temp_shared[((((((int)threadIdx.z) * 256) + (((int)threadIdx.x) * 19)) + 18))] = (((((1 <= (((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 18) >> 4)) % 3))) && ((((int)blockIdx.y) + (((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 18) >> 4)) % 3)) < 29)) && (1 <= ((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 2) & 15)))) && (((((int)blockIdx.x) * 14) + (((((int)threadIdx.x) * 19) + 2) & 15)) < 29)) ? data[((((((((rc_outer * 12544) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 18) >> 4)) / 3) * 784)) + (((int)blockIdx.y) * 28)) + ((((((int)threadIdx.z) * 16) + (((((int)threadIdx.x) * 19) + 18) >> 4)) % 3) * 28)) + (((int)blockIdx.x) * 14)) + (((((int)threadIdx.x) * 19) + 2) & 15)) - 29))] : 0.000000e+00f);
        }
      }
    }
    kernel_shared[(((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + (((((int)threadIdx.x) * 14) / 48) * 1440)) + (rc_outer * 144)) + (((((int)threadIdx.x) * 14) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 1))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + (((((int)threadIdx.x) * 14) / 48) * 1440)) + (rc_outer * 144)) + (((((int)threadIdx.x) * 14) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 2))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + (((((int)threadIdx.x) * 14) / 48) * 1440)) + (rc_outer * 144)) + (((((int)threadIdx.x) * 14) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 3))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 1) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 1) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 4))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 1) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 1) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 5))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 1) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 1) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 6))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 2) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 2) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 7))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 2) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 2) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 8))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 2) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 2) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 9))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 3) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 3) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 10))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 3) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 3) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 11))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 3) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 3) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 12))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 4) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 4) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 13))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 4) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 4) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 14))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 4) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 4) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 15))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 5) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 5) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 16))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 5) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 5) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 17))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 5) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 5) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 18))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 6) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 6) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 19))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 6) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 6) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 20))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 6) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 6) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 21))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 7) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 7) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 22))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 7) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 7) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 23))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 7) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 7) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 24))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 8) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 8) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 25))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 8) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 8) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 26))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 8) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 8) % 48) * 3)) + 2))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 27))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 9) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 9) % 48) * 3)))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 28))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 9) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 9) % 48) * 3)) + 1))];
    kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 29))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 9) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 9) % 48) * 3)) + 2))];
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 10) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 10) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 566) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1698) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 30))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 10) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 10) % 48) * 3)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 10) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 10) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 566) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1697) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 31))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 10) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 10) % 48) * 3)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 10) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 10) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 566) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1696) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 32))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 10) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 10) % 48) * 3)) + 2))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 11) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 11) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 565) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1695) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 33))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 11) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 11) % 48) * 3)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 11) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 11) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 565) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1694) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 34))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 11) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 11) % 48) * 3)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 11) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 11) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 565) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1693) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 35))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 11) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 11) % 48) * 3)) + 2))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 12) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + ((((int)threadIdx.x) * 14) / 3)) < 188) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 564) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1692) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 36))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 12) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 12) % 48) * 3)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 12) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + ((((int)threadIdx.x) * 14) / 3)) < 188) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 564) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1691) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 37))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 12) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 12) % 48) * 3)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 12) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + ((((int)threadIdx.x) * 14) / 3)) < 188) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 564) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1690) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 38))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 12) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 12) % 48) * 3)) + 2))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 13) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 13) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 563) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1689) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 39))] = kernel[((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 13) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 13) % 48) * 3)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 13) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 13) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 563) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1688) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 40))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 13) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 13) % 48) * 3)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 14) + 13) / 48)) < 12) {
      if (((((int)threadIdx.z) * 64) + (((((int)threadIdx.x) * 14) + 13) / 3)) < 192) {
        if (((((int)threadIdx.z) * 192) + (((int)threadIdx.x) * 14)) < 563) {
          if (((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) < 1687) {
            if (((int)threadIdx.x) < 13) {
              kernel_shared[((((((int)threadIdx.z) * 576) + (((int)threadIdx.x) * 42)) + 41))] = kernel[(((((((((int)blockIdx.z) * 17280) + (((int)threadIdx.z) * 5760)) + ((((((int)threadIdx.x) * 14) + 13) / 48) * 1440)) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 14) + 13) % 48) * 3)) + 2))];
            }
          }
        }
      }
    }
    __syncthreads();
    pad_temp_shared_local[(0)] = pad_temp_shared[(((int)threadIdx.x))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 48))];
    kernel_shared_local[(0)] = kernel_shared[((((int)threadIdx.z) * 576))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 9))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 144))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 153))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 288))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 297))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 432))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 441))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 1))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 49))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 1))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 10))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 145))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 154))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 289))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 298))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 433))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 442))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 2))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 50))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 2))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 11))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 146))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 155))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 290))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 299))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 434))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 443))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 16))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 64))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 3))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 12))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 147))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 156))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 291))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 300))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 435))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 444))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 17))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 65))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 4))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 13))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 148))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 157))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 292))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 301))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 436))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 445))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 18))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 66))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 5))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 14))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 149))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 158))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 293))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 302))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 437))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 446))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 32))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 80))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 6))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 15))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 150))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 159))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 294))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 303))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 438))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 447))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 33))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 81))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 7))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 16))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 151))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 160))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 295))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 304))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 439))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 448))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 34))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 82))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 8))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 17))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 152))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 161))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 296))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 305))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 440))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 449))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 96))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 144))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 18))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 27))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 162))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 171))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 306))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 315))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 450))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 459))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 97))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 145))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 19))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 28))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 163))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 172))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 307))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 316))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 451))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 460))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 98))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 146))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 20))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 29))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 164))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 173))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 308))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 317))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 452))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 461))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 112))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 160))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 21))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 30))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 165))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 174))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 309))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 318))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 453))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 462))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 113))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 161))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 22))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 31))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 166))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 175))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 310))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 319))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 454))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 463))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 114))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 162))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 23))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 32))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 167))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 176))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 311))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 320))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 455))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 464))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 128))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 176))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 24))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 33))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 168))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 177))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 312))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 321))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 456))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 465))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 129))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 177))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 25))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 34))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 169))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 178))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 313))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 322))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 457))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 466))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 130))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 178))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 26))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 35))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 170))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 179))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 314))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 323))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 458))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 467))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 192))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 240))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 36))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 45))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 180))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 189))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 324))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 333))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 468))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 477))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 193))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 241))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 37))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 46))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 181))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 190))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 325))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 334))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 469))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 478))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 194))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 242))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 38))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 47))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 182))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 191))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 326))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 335))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 470))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 479))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 208))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 256))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 39))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 48))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 183))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 192))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 327))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 336))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 471))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 480))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 209))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 257))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 40))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 49))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 184))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 193))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 328))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 337))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 472))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 481))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 210))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 258))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 41))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 50))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 185))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 194))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 329))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 338))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 473))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 482))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 224))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 272))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 42))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 51))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 186))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 195))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 330))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 339))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 474))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 483))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 225))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 273))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 43))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 52))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 187))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 196))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 331))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 340))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 475))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 484))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 226))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 274))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 44))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 53))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 188))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 197))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 332))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 341))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 476))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 485))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 288))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 336))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 54))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 63))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 198))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 207))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 342))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 351))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 486))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 495))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 289))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 337))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 55))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 64))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 199))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 208))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 343))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 352))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 487))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 496))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 290))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 338))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 56))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 65))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 200))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 209))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 344))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 353))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 488))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 497))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 304))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 352))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 57))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 66))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 201))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 210))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 345))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 354))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 489))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 498))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 305))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 353))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 58))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 67))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 202))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 211))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 346))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 355))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 490))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 499))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 306))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 354))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 59))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 68))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 203))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 212))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 347))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 356))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 491))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 500))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 320))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 368))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 60))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 69))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 204))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 213))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 348))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 357))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 492))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 501))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 321))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 369))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 61))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 70))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 205))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 214))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 349))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 358))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 493))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 502))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 322))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 370))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 62))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 71))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 206))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 215))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 350))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 359))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 494))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 503))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 384))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 432))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 72))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 81))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 216))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 225))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 360))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 369))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 504))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 513))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 385))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 433))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 73))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 82))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 217))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 226))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 361))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 370))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 505))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 514))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 386))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 434))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 74))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 83))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 218))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 227))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 362))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 371))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 506))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 515))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 400))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 448))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 75))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 84))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 219))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 228))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 363))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 372))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 507))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 516))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 401))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 449))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 76))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 85))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 220))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 229))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 364))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 373))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 508))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 517))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 402))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 450))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 77))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 86))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 221))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 230))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 365))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 374))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 509))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 518))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 416))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 464))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 78))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 87))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 222))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 231))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 366))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 375))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 510))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 519))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 417))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 465))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 79))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 88))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 223))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 232))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 367))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 376))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 511))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 520))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 418))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 466))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 80))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 89))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 224))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 233))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 368))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 377))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 512))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 521))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 480))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 528))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 90))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 99))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 234))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 243))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 378))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 387))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 522))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 531))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 481))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 529))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 91))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 100))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 235))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 244))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 379))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 388))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 523))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 532))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 482))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 530))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 92))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 101))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 236))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 245))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 380))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 389))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 524))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 533))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 496))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 544))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 93))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 102))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 237))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 246))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 381))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 390))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 525))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 534))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 497))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 545))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 94))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 103))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 238))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 247))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 382))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 391))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 526))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 535))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 498))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 546))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 95))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 104))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 239))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 248))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 383))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 392))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 527))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 536))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 512))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 560))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 96))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 105))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 240))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 249))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 384))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 393))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 528))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 537))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 513))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 561))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 97))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 106))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 241))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 250))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 385))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 394))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 529))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 538))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 514))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 562))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 98))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 107))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 242))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 251))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 386))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 395))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 530))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 539))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 576))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 624))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 108))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 117))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 252))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 261))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 396))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 405))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 540))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 549))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 577))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 625))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 109))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 118))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 253))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 262))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 397))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 406))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 541))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 550))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 578))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 626))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 110))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 119))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 254))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 263))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 398))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 407))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 542))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 551))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 592))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 640))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 111))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 120))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 255))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 264))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 399))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 408))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 543))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 552))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 593))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 641))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 112))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 121))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 256))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 265))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 400))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 409))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 544))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 553))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 594))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 642))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 113))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 122))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 257))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 266))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 401))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 410))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 545))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 554))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 608))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 656))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 114))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 123))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 258))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 267))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 402))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 411))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 546))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 555))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 609))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 657))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 115))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 124))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 259))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 268))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 403))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 412))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 547))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 556))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 610))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 658))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 116))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 125))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 260))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 269))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 404))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 413))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 548))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 557))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 672))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 720))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 126))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 135))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 270))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 279))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 414))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 423))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 558))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 567))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 673))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 721))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 127))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 136))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 271))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 280))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 415))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 424))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 559))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 568))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 674))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 722))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 128))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 137))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 272))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 281))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 416))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 425))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 560))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 569))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 688))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 736))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 129))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 138))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 273))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 282))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 417))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 426))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 561))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 570))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 689))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 737))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 130))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 139))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 274))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 283))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 418))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 427))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 562))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 571))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 690))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 738))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 131))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 140))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 275))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 284))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 419))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 428))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 563))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 572))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 704))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 752))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 132))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 141))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 276))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 285))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 420))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 429))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 564))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 573))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 705))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 753))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 133))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 142))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 277))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 286))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 421))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 430))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 565))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 574))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
    pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 706))];
    pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 754))];
    kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 576) + 134))];
    kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 576) + 143))];
    kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 576) + 278))];
    kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 576) + 287))];
    kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 576) + 422))];
    kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 576) + 431))];
    kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 576) + 566))];
    kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 576) + 575))];
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(2)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(4)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
    compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
    compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(3)]));
    compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(5)]));
    compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
  }
  compute[((((((((int)blockIdx.z) * 9408) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 28)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)))] = compute_local[(0)];
  compute[(((((((((int)blockIdx.z) * 9408) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 28)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 784))] = compute_local[(1)];
  compute[(((((((((int)blockIdx.z) * 9408) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 28)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 1568))] = compute_local[(2)];
  compute[(((((((((int)blockIdx.z) * 9408) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 28)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 2352))] = compute_local[(3)];
}

int main(int argc, char *argv[]){
    dim3 grid(2,28,8);
    dim3 block(14,1,3);
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
