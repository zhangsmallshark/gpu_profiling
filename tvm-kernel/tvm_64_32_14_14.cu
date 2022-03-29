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
  float compute_local[2];
  __shared__ float pad_temp_shared[256];
  __shared__ float kernel_shared[1536];
  float pad_temp_shared_local[16];
  float kernel_shared_local[8];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    for (int ry_outer = 0; ry_outer < 3; ++ry_outer) {
      __syncthreads();
      if (((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) < 256) {
        if (((int)threadIdx.x) < 4) {
          pad_temp_shared[(((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)))] = (((((1 <= (((int)blockIdx.y) + ry_outer)) && ((((int)blockIdx.y) + ry_outer) < 15)) && (1 <= (((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) & 15))) && ((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) & 15) < 15)) ? data[(((((((rc_outer * 3136) + ((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) >> 4) * 196)) + (((int)blockIdx.y) * 14)) + (ry_outer * 14)) + (((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) & 15)) - 15))] : 0.000000e+00f);
        }
      }
      if (((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) < 255) {
        if (((int)threadIdx.x) < 4) {
          pad_temp_shared[((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) + 1))] = (((((1 <= (((int)blockIdx.y) + ry_outer)) && ((((int)blockIdx.y) + ry_outer) < 15)) && (1 <= ((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) + 1) & 15))) && (((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) + 1) & 15) < 15)) ? data[(((((((rc_outer * 3136) + (((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) + 1) >> 4) * 196)) + (((int)blockIdx.y) * 14)) + (ry_outer * 14)) + ((((((int)threadIdx.z) * 8) + (((int)threadIdx.x) * 2)) + 1) & 15)) - 15))] : 0.000000e+00f);
        }
      }
      kernel_shared[(((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)))] = kernel[((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + (((((int)threadIdx.x) * 7) / 3) * 9)) + (ry_outer * 3)) + ((((int)threadIdx.x) * 7) % 3)))];
      kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 1))] = kernel[((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 7) + 1) / 3) * 9)) + (ry_outer * 3)) + (((((int)threadIdx.x) * 7) + 1) % 3)))];
      kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 2))] = kernel[((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 7) + 2) / 3) * 9)) + (ry_outer * 3)) + (((((int)threadIdx.x) * 7) + 2) % 3)))];
      kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 3))] = kernel[(((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + (((((int)threadIdx.x) * 7) / 3) * 9)) + (ry_outer * 3)) + ((((int)threadIdx.x) * 7) % 3)) + 9))];
      kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 4))] = kernel[((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 7) + 4) / 3) * 9)) + (ry_outer * 3)) + (((((int)threadIdx.x) * 7) + 1) % 3)))];
      kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 5))] = kernel[((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + ((((((int)threadIdx.x) * 7) + 5) / 3) * 9)) + (ry_outer * 3)) + (((((int)threadIdx.x) * 7) + 2) % 3)))];
      if (((((((int)threadIdx.x) * 7) + 6) / 48) + ((int)threadIdx.z)) < 32) {
        if (((((int)threadIdx.z) * 16) + ((((int)threadIdx.x) * 7) / 3)) < 510) {
          if (((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) < 1530) {
            if (((int)threadIdx.x) < 6) {
              kernel_shared[((((((int)threadIdx.z) * 48) + (((int)threadIdx.x) * 7)) + 6))] = kernel[(((((((((int)threadIdx.z) * 576) + (rc_outer * 144)) + (((((int)threadIdx.x) * 7) / 3) * 9)) + (ry_outer * 3)) + ((((int)threadIdx.x) * 7) % 3)) + 18))];
            }
          }
        }
      }
      __syncthreads();
      pad_temp_shared_local[(0)] = pad_temp_shared[(((int)threadIdx.x))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 7))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 16))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 23))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 32))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 39))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 48))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 55))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 64))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 71))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 80))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 87))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 96))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 103))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 112))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 119))];
      kernel_shared_local[(0)] = kernel_shared[((((int)threadIdx.z) * 48))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 3))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 6))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 9))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 12))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 15))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 18))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 21))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
      pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 1))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 8))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 17))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 24))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 33))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 40))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 49))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 56))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 65))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 72))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 81))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 88))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 97))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 104))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 113))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 120))];
      kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 48) + 1))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 4))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 7))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 10))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 13))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 16))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 19))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 22))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
      pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 2))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 9))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 18))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 25))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 34))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 41))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 50))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 57))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 66))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 73))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 82))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 89))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 98))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 105))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 114))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 121))];
      kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 48) + 2))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 5))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 8))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 11))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 14))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 17))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 20))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 23))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
      pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 128))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 135))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 144))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 151))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 160))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 167))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 176))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 183))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 192))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 199))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 208))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 215))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 224))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 231))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 240))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 247))];
      kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 48) + 24))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 27))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 30))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 33))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 36))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 39))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 42))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 45))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
      pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 129))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 136))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 145))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 152))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 161))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 168))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 177))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 184))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 193))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 200))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 209))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 216))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 225))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 232))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 241))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 248))];
      kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 48) + 25))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 28))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 31))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 34))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 37))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 40))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 43))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 46))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
      pad_temp_shared_local[(0)] = pad_temp_shared[((((int)threadIdx.x) + 130))];
      pad_temp_shared_local[(8)] = pad_temp_shared[((((int)threadIdx.x) + 137))];
      pad_temp_shared_local[(1)] = pad_temp_shared[((((int)threadIdx.x) + 146))];
      pad_temp_shared_local[(9)] = pad_temp_shared[((((int)threadIdx.x) + 153))];
      pad_temp_shared_local[(2)] = pad_temp_shared[((((int)threadIdx.x) + 162))];
      pad_temp_shared_local[(10)] = pad_temp_shared[((((int)threadIdx.x) + 169))];
      pad_temp_shared_local[(3)] = pad_temp_shared[((((int)threadIdx.x) + 178))];
      pad_temp_shared_local[(11)] = pad_temp_shared[((((int)threadIdx.x) + 185))];
      pad_temp_shared_local[(4)] = pad_temp_shared[((((int)threadIdx.x) + 194))];
      pad_temp_shared_local[(12)] = pad_temp_shared[((((int)threadIdx.x) + 201))];
      pad_temp_shared_local[(5)] = pad_temp_shared[((((int)threadIdx.x) + 210))];
      pad_temp_shared_local[(13)] = pad_temp_shared[((((int)threadIdx.x) + 217))];
      pad_temp_shared_local[(6)] = pad_temp_shared[((((int)threadIdx.x) + 226))];
      pad_temp_shared_local[(14)] = pad_temp_shared[((((int)threadIdx.x) + 233))];
      pad_temp_shared_local[(7)] = pad_temp_shared[((((int)threadIdx.x) + 242))];
      pad_temp_shared_local[(15)] = pad_temp_shared[((((int)threadIdx.x) + 249))];
      kernel_shared_local[(0)] = kernel_shared[(((((int)threadIdx.z) * 48) + 26))];
      kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 48) + 29))];
      kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 48) + 32))];
      kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 48) + 35))];
      kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 48) + 38))];
      kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 48) + 41))];
      kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 48) + 44))];
      kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 48) + 47))];
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(0)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(1)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(2)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(3)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(4)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(5)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(6)]));
      compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
      compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(7)]));
    }
  }
  compute[((((((int)threadIdx.z) * 196) + (((int)blockIdx.y) * 14)) + ((int)threadIdx.x)))] = compute_local[(0)];
  compute[(((((((int)threadIdx.z) * 196) + (((int)blockIdx.y) * 14)) + ((int)threadIdx.x)) + 7))] = compute_local[(1)];
}
//grid=(7,2,8),  block=(2,1,4)
int main(int argc, char *argv[]){
    dim3 grid(1,14,1);
    dim3 block(7,1,32);
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
