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
  float compute_local[2];
  __shared__ float pad_temp_shared[432];
  __shared__ float kernel_shared[2880];
  float pad_temp_shared_local[6];
  float kernel_shared_local[12];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    for (int rx_outer = 0; rx_outer < 3; ++rx_outer) {
      __syncthreads();
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 432) {
        pad_temp_shared[(((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)))] = (((((1 <= (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) % 9)) && ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) / 9) * 49)) + ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 431) {
        pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 1))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 1) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 1) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 1) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 1) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 430) {
        if (((int)threadIdx.y) < 6) {
          pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 2))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 2) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 2) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 2) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 2) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        }
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 429) {
        if (((int)threadIdx.y) < 6) {
          pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 3))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 3) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 3) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 3) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 3) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        }
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 428) {
        if (((int)threadIdx.y) < 6) {
          pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 4))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 4) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 4) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 4) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 4) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        }
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 427) {
        if (((int)threadIdx.y) < 6) {
          pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 5))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 5) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 5) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 5) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 5) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        }
      }
      if (((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) < 426) {
        if (((int)threadIdx.y) < 6) {
          pad_temp_shared[((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 6))] = (((((1 <= ((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 6) % 9)) && (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 6) % 9) < 8)) && (1 <= (((int)blockIdx.x) + rx_outer))) && ((((int)blockIdx.x) + rx_outer) < 8)) ? data[(((((((rc_outer * 2352) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 6) / 9) * 49)) + (((((((int)threadIdx.z) * 44) + (((int)threadIdx.y) * 7)) + 6) % 9) * 7)) + ((int)blockIdx.x)) + rx_outer) - 8))] : 0.000000e+00f);
        }
      }
      kernel_shared[(((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + (((((int)threadIdx.y) * 14) / 48) * 1728)) + (rc_outer * 432)) + (((((int)threadIdx.y) * 14) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 1))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + (((((int)threadIdx.y) * 14) / 48) * 1728)) + (rc_outer * 432)) + (((((int)threadIdx.y) * 14) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 2))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + (((((int)threadIdx.y) * 14) / 48) * 1728)) + (rc_outer * 432)) + (((((int)threadIdx.y) * 14) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 3))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 1) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 1) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 4))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 1) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 1) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 5))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 1) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 1) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 6))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 2) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 2) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 7))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 2) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 2) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 8))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 2) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 2) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 9))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 3) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 3) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 10))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 3) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 3) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 11))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 3) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 3) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 12))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 4) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 4) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 13))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 4) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 4) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 14))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 4) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 4) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 15))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 5) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 5) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 16))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 5) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 5) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 17))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 5) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 5) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 18))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 6) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 6) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 19))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 6) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 6) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 20))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 6) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 6) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 21))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 7) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 7) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 22))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 7) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 7) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 23))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 7) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 7) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 24))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 8) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 8) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 25))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 8) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 8) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 26))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 8) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 8) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 27))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 9) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 9) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 28))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 9) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 9) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 29))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 9) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 9) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 30))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 10) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 10) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 31))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 10) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 10) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 32))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 10) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 10) % 48) * 9)) + rx_outer) + 6))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 33))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 11) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 11) % 48) * 9)) + rx_outer))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 34))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 11) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 11) % 48) * 9)) + rx_outer) + 3))];
      kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 35))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 11) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 11) % 48) * 9)) + rx_outer) + 6))];
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 12) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 948) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2844) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 36))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 12) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 12) % 48) * 9)) + rx_outer))];
            }
          }
        }
      }
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 12) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 948) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2843) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 37))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 12) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 12) % 48) * 9)) + rx_outer) + 3))];
            }
          }
        }
      }
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 12) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 948) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2842) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 38))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 12) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 12) % 48) * 9)) + rx_outer) + 6))];
            }
          }
        }
      }
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 13) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 947) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2841) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 39))] = kernel[(((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 13) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 13) % 48) * 9)) + rx_outer))];
            }
          }
        }
      }
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 13) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 947) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2840) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 40))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 13) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 13) % 48) * 9)) + rx_outer) + 3))];
            }
          }
        }
      }
      if (((((int)threadIdx.z) * 2) + (((((int)threadIdx.y) * 14) + 13) / 48)) < 20) {
        if (((((int)threadIdx.z) * 96) + (((int)threadIdx.y) * 14)) < 947) {
          if (((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) < 2839) {
            if (((int)threadIdx.y) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 288) + (((int)threadIdx.y) * 42)) + 41))] = kernel[((((((((((int)blockIdx.z) * 34560) + (((int)threadIdx.z) * 3456)) + ((((((int)threadIdx.y) * 14) + 13) / 48) * 1728)) + (rc_outer * 432)) + ((((((int)threadIdx.y) * 14) + 13) % 48) * 9)) + rx_outer) + 6))];
            }
          }
        }
      }
      __syncthreads();
      for (int rc_inner_outer = 0; rc_inner_outer < 24; ++rc_inner_outer) {
        pad_temp_shared_local[(0)] = pad_temp_shared[(((rc_inner_outer * 18) + ((int)threadIdx.y)))];
        pad_temp_shared_local[(1)] = pad_temp_shared[((((rc_inner_outer * 18) + ((int)threadIdx.y)) + 1))];
        pad_temp_shared_local[(2)] = pad_temp_shared[((((rc_inner_outer * 18) + ((int)threadIdx.y)) + 2))];
        pad_temp_shared_local[(3)] = pad_temp_shared[((((rc_inner_outer * 18) + ((int)threadIdx.y)) + 9))];
        pad_temp_shared_local[(4)] = pad_temp_shared[((((rc_inner_outer * 18) + ((int)threadIdx.y)) + 10))];
        pad_temp_shared_local[(5)] = pad_temp_shared[((((rc_inner_outer * 18) + ((int)threadIdx.y)) + 11))];
        kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)))];
        kernel_shared_local[(1)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 1))];
        kernel_shared_local[(2)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 2))];
        kernel_shared_local[(3)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 3))];
        kernel_shared_local[(4)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 4))];
        kernel_shared_local[(5)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 5))];
        kernel_shared_local[(6)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 144))];
        kernel_shared_local[(7)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 145))];
        kernel_shared_local[(8)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 146))];
        kernel_shared_local[(9)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 147))];
        kernel_shared_local[(10)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 148))];
        kernel_shared_local[(11)] = kernel_shared[((((((int)threadIdx.z) * 288) + (rc_inner_outer * 6)) + 149))];
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(6)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(7)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(8)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(9)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(10)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(11)]));
      }
    }
  }
  compute[(((((((int)blockIdx.z) * 980) + (((int)threadIdx.z) * 98)) + (((int)threadIdx.y) * 7)) + ((int)blockIdx.x)))] = compute_local[(0)];
  compute[((((((((int)blockIdx.z) * 980) + (((int)threadIdx.z) * 98)) + (((int)threadIdx.y) * 7)) + ((int)blockIdx.x)) + 49))] = compute_local[(1)];
}

//grid=(7,1,5),  block=(1,1,32)
int main(int argc, char *argv[]){
    dim3 grid(7,1,8);
    dim3 block(1,7,10);
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
