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
  __shared__ float pad_temp_shared[1792];
  __shared__ float kernel_shared[512];
  float pad_temp_shared_local[64];
  float kernel_shared_local[64];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(2)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  compute_local[(3)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 2; ++rc_outer) {
    for (int ry_outer = 0; ry_outer < 3; ++ry_outer) {
      for (int rx_outer = 0; rx_outer < 3; ++rx_outer) {
        __syncthreads();
        pad_temp_shared[((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)))] = (((((1 <= (((((int)blockIdx.y) * 2) + (((((int)threadIdx.x) % 7) * 8) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + (((((int)threadIdx.x) % 7) * 8) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + ((((int)threadIdx.x) * 8) % 28)))) && ((rx_outer + ((((int)threadIdx.x) * 8) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((int)threadIdx.x) / 7) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + ((((int)threadIdx.x) % 7) * 8)) + rx_outer) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 1))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 1) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 1) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 1) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 1) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 1) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 1) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 2))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 2) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 2) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 2) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 2) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 2) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 2) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 3))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 3) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 3) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 3) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 3) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 3) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 3) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 4))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 4) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 4) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 4) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 4) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 4) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 4) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 5))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 5) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 5) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 5) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 5) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 5) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 5) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 6))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 6) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 6) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 6) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 6) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 6) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 6) % 56)) - 29))] : 0.000000e+00f);
        pad_temp_shared[(((((((int)threadIdx.z) * 224) + (((int)threadIdx.y) * 112)) + (((int)threadIdx.x) * 8)) + 7))] = (((((1 <= (((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 7) % 56) / 28)) + ry_outer)) && ((((((int)blockIdx.y) * 2) + ((((((int)threadIdx.x) * 8) + 7) % 56) / 28)) + ry_outer) < 29)) && (1 <= (rx_outer + (((((int)threadIdx.x) * 8) + 7) % 28)))) && ((rx_outer + (((((int)threadIdx.x) * 8) + 7) % 28)) < 29)) ? data[((((((((((rc_outer * 25088) + (((int)threadIdx.z) * 3136)) + (((int)threadIdx.y) * 1568)) + ((((((int)threadIdx.x) * 8) + 7) / 56) * 784)) + (((int)blockIdx.y) * 56)) + (ry_outer * 28)) + rx_outer) + (((((int)threadIdx.x) * 8) + 7) % 56)) - 29))] : 0.000000e+00f);
        if ((((((int)threadIdx.z) * 2) + ((((int)threadIdx.x) * 3) >> 5)) + ((int)threadIdx.y)) < 16) {
          if ((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)) < 512) {
            if (((((int)threadIdx.y) * 32) + (((int)threadIdx.x) * 3)) < 64) {
              if (((int)threadIdx.x) < 11) {
                kernel_shared[((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)))] = kernel[((((((((((int)blockIdx.z) * 9216) + (((int)threadIdx.z) * 1152)) + (((int)threadIdx.y) * 576)) + (rc_outer * 288)) + (((int)threadIdx.x) * 27)) + (ry_outer * 3)) + rx_outer))];
              }
            }
          }
        }
        if ((((((int)threadIdx.z) * 2) + (((((int)threadIdx.x) * 3) + 1) >> 5)) + ((int)threadIdx.y)) < 16) {
          if ((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)) < 511) {
            if (((((int)threadIdx.y) * 32) + (((int)threadIdx.x) * 3)) < 63) {
              if (((int)threadIdx.x) < 11) {
                kernel_shared[(((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)) + 1))] = kernel[(((((((((((int)blockIdx.z) * 9216) + (((int)threadIdx.z) * 1152)) + (((int)threadIdx.y) * 576)) + (rc_outer * 288)) + (((int)threadIdx.x) * 27)) + (ry_outer * 3)) + rx_outer) + 9))];
              }
            }
          }
        }
        if ((((((int)threadIdx.z) * 2) + (((((int)threadIdx.x) * 3) + 2) >> 5)) + ((int)threadIdx.y)) < 16) {
          if ((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)) < 510) {
            if (((((int)threadIdx.y) * 32) + (((int)threadIdx.x) * 3)) < 62) {
              if (((int)threadIdx.x) < 10) {
                kernel_shared[(((((((int)threadIdx.z) * 64) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 3)) + 2))] = kernel[(((((((((((int)blockIdx.z) * 9216) + (((int)threadIdx.z) * 1152)) + (((int)threadIdx.y) * 576)) + (rc_outer * 288)) + (((int)threadIdx.x) * 27)) + (ry_outer * 3)) + rx_outer) + 18))];
              }
            }
          }
        }
        __syncthreads();
        pad_temp_shared_local[(0)] = pad_temp_shared[(((((int)threadIdx.y) * 28) + ((int)threadIdx.x)))];
        pad_temp_shared_local[(32)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 14))];
        pad_temp_shared_local[(1)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 56))];
        pad_temp_shared_local[(33)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 70))];
        pad_temp_shared_local[(2)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 112))];
        pad_temp_shared_local[(34)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 126))];
        pad_temp_shared_local[(3)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 168))];
        pad_temp_shared_local[(35)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 182))];
        pad_temp_shared_local[(4)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 224))];
        pad_temp_shared_local[(36)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 238))];
        pad_temp_shared_local[(5)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 280))];
        pad_temp_shared_local[(37)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 294))];
        pad_temp_shared_local[(6)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 336))];
        pad_temp_shared_local[(38)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 350))];
        pad_temp_shared_local[(7)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 392))];
        pad_temp_shared_local[(39)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 406))];
        pad_temp_shared_local[(8)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 448))];
        pad_temp_shared_local[(40)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 462))];
        pad_temp_shared_local[(9)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 504))];
        pad_temp_shared_local[(41)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 518))];
        pad_temp_shared_local[(10)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 560))];
        pad_temp_shared_local[(42)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 574))];
        pad_temp_shared_local[(11)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 616))];
        pad_temp_shared_local[(43)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 630))];
        pad_temp_shared_local[(12)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 672))];
        pad_temp_shared_local[(44)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 686))];
        pad_temp_shared_local[(13)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 728))];
        pad_temp_shared_local[(45)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 742))];
        pad_temp_shared_local[(14)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 784))];
        pad_temp_shared_local[(46)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 798))];
        pad_temp_shared_local[(15)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 840))];
        pad_temp_shared_local[(47)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 854))];
        pad_temp_shared_local[(16)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 896))];
        pad_temp_shared_local[(48)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 910))];
        pad_temp_shared_local[(17)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 952))];
        pad_temp_shared_local[(49)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 966))];
        pad_temp_shared_local[(18)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1008))];
        pad_temp_shared_local[(50)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1022))];
        pad_temp_shared_local[(19)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1064))];
        pad_temp_shared_local[(51)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1078))];
        pad_temp_shared_local[(20)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1120))];
        pad_temp_shared_local[(52)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1134))];
        pad_temp_shared_local[(21)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1176))];
        pad_temp_shared_local[(53)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1190))];
        pad_temp_shared_local[(22)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1232))];
        pad_temp_shared_local[(54)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1246))];
        pad_temp_shared_local[(23)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1288))];
        pad_temp_shared_local[(55)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1302))];
        pad_temp_shared_local[(24)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1344))];
        pad_temp_shared_local[(56)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1358))];
        pad_temp_shared_local[(25)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1400))];
        pad_temp_shared_local[(57)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1414))];
        pad_temp_shared_local[(26)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1456))];
        pad_temp_shared_local[(58)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1470))];
        pad_temp_shared_local[(27)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1512))];
        pad_temp_shared_local[(59)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1526))];
        pad_temp_shared_local[(28)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1568))];
        pad_temp_shared_local[(60)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1582))];
        pad_temp_shared_local[(29)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1624))];
        pad_temp_shared_local[(61)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1638))];
        pad_temp_shared_local[(30)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1680))];
        pad_temp_shared_local[(62)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1694))];
        pad_temp_shared_local[(31)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1736))];
        pad_temp_shared_local[(63)] = pad_temp_shared[((((((int)threadIdx.y) * 28) + ((int)threadIdx.x)) + 1750))];
        kernel_shared_local[(0)] = kernel_shared[((((int)threadIdx.z) * 64))];
        kernel_shared_local[(1)] = kernel_shared[(((((int)threadIdx.z) * 64) + 1))];
        kernel_shared_local[(2)] = kernel_shared[(((((int)threadIdx.z) * 64) + 2))];
        kernel_shared_local[(3)] = kernel_shared[(((((int)threadIdx.z) * 64) + 3))];
        kernel_shared_local[(4)] = kernel_shared[(((((int)threadIdx.z) * 64) + 4))];
        kernel_shared_local[(5)] = kernel_shared[(((((int)threadIdx.z) * 64) + 5))];
        kernel_shared_local[(6)] = kernel_shared[(((((int)threadIdx.z) * 64) + 6))];
        kernel_shared_local[(7)] = kernel_shared[(((((int)threadIdx.z) * 64) + 7))];
        kernel_shared_local[(8)] = kernel_shared[(((((int)threadIdx.z) * 64) + 8))];
        kernel_shared_local[(9)] = kernel_shared[(((((int)threadIdx.z) * 64) + 9))];
        kernel_shared_local[(10)] = kernel_shared[(((((int)threadIdx.z) * 64) + 10))];
        kernel_shared_local[(11)] = kernel_shared[(((((int)threadIdx.z) * 64) + 11))];
        kernel_shared_local[(12)] = kernel_shared[(((((int)threadIdx.z) * 64) + 12))];
        kernel_shared_local[(13)] = kernel_shared[(((((int)threadIdx.z) * 64) + 13))];
        kernel_shared_local[(14)] = kernel_shared[(((((int)threadIdx.z) * 64) + 14))];
        kernel_shared_local[(15)] = kernel_shared[(((((int)threadIdx.z) * 64) + 15))];
        kernel_shared_local[(16)] = kernel_shared[(((((int)threadIdx.z) * 64) + 16))];
        kernel_shared_local[(17)] = kernel_shared[(((((int)threadIdx.z) * 64) + 17))];
        kernel_shared_local[(18)] = kernel_shared[(((((int)threadIdx.z) * 64) + 18))];
        kernel_shared_local[(19)] = kernel_shared[(((((int)threadIdx.z) * 64) + 19))];
        kernel_shared_local[(20)] = kernel_shared[(((((int)threadIdx.z) * 64) + 20))];
        kernel_shared_local[(21)] = kernel_shared[(((((int)threadIdx.z) * 64) + 21))];
        kernel_shared_local[(22)] = kernel_shared[(((((int)threadIdx.z) * 64) + 22))];
        kernel_shared_local[(23)] = kernel_shared[(((((int)threadIdx.z) * 64) + 23))];
        kernel_shared_local[(24)] = kernel_shared[(((((int)threadIdx.z) * 64) + 24))];
        kernel_shared_local[(25)] = kernel_shared[(((((int)threadIdx.z) * 64) + 25))];
        kernel_shared_local[(26)] = kernel_shared[(((((int)threadIdx.z) * 64) + 26))];
        kernel_shared_local[(27)] = kernel_shared[(((((int)threadIdx.z) * 64) + 27))];
        kernel_shared_local[(28)] = kernel_shared[(((((int)threadIdx.z) * 64) + 28))];
        kernel_shared_local[(29)] = kernel_shared[(((((int)threadIdx.z) * 64) + 29))];
        kernel_shared_local[(30)] = kernel_shared[(((((int)threadIdx.z) * 64) + 30))];
        kernel_shared_local[(31)] = kernel_shared[(((((int)threadIdx.z) * 64) + 31))];
        kernel_shared_local[(32)] = kernel_shared[(((((int)threadIdx.z) * 64) + 32))];
        kernel_shared_local[(33)] = kernel_shared[(((((int)threadIdx.z) * 64) + 33))];
        kernel_shared_local[(34)] = kernel_shared[(((((int)threadIdx.z) * 64) + 34))];
        kernel_shared_local[(35)] = kernel_shared[(((((int)threadIdx.z) * 64) + 35))];
        kernel_shared_local[(36)] = kernel_shared[(((((int)threadIdx.z) * 64) + 36))];
        kernel_shared_local[(37)] = kernel_shared[(((((int)threadIdx.z) * 64) + 37))];
        kernel_shared_local[(38)] = kernel_shared[(((((int)threadIdx.z) * 64) + 38))];
        kernel_shared_local[(39)] = kernel_shared[(((((int)threadIdx.z) * 64) + 39))];
        kernel_shared_local[(40)] = kernel_shared[(((((int)threadIdx.z) * 64) + 40))];
        kernel_shared_local[(41)] = kernel_shared[(((((int)threadIdx.z) * 64) + 41))];
        kernel_shared_local[(42)] = kernel_shared[(((((int)threadIdx.z) * 64) + 42))];
        kernel_shared_local[(43)] = kernel_shared[(((((int)threadIdx.z) * 64) + 43))];
        kernel_shared_local[(44)] = kernel_shared[(((((int)threadIdx.z) * 64) + 44))];
        kernel_shared_local[(45)] = kernel_shared[(((((int)threadIdx.z) * 64) + 45))];
        kernel_shared_local[(46)] = kernel_shared[(((((int)threadIdx.z) * 64) + 46))];
        kernel_shared_local[(47)] = kernel_shared[(((((int)threadIdx.z) * 64) + 47))];
        kernel_shared_local[(48)] = kernel_shared[(((((int)threadIdx.z) * 64) + 48))];
        kernel_shared_local[(49)] = kernel_shared[(((((int)threadIdx.z) * 64) + 49))];
        kernel_shared_local[(50)] = kernel_shared[(((((int)threadIdx.z) * 64) + 50))];
        kernel_shared_local[(51)] = kernel_shared[(((((int)threadIdx.z) * 64) + 51))];
        kernel_shared_local[(52)] = kernel_shared[(((((int)threadIdx.z) * 64) + 52))];
        kernel_shared_local[(53)] = kernel_shared[(((((int)threadIdx.z) * 64) + 53))];
        kernel_shared_local[(54)] = kernel_shared[(((((int)threadIdx.z) * 64) + 54))];
        kernel_shared_local[(55)] = kernel_shared[(((((int)threadIdx.z) * 64) + 55))];
        kernel_shared_local[(56)] = kernel_shared[(((((int)threadIdx.z) * 64) + 56))];
        kernel_shared_local[(57)] = kernel_shared[(((((int)threadIdx.z) * 64) + 57))];
        kernel_shared_local[(58)] = kernel_shared[(((((int)threadIdx.z) * 64) + 58))];
        kernel_shared_local[(59)] = kernel_shared[(((((int)threadIdx.z) * 64) + 59))];
        kernel_shared_local[(60)] = kernel_shared[(((((int)threadIdx.z) * 64) + 60))];
        kernel_shared_local[(61)] = kernel_shared[(((((int)threadIdx.z) * 64) + 61))];
        kernel_shared_local[(62)] = kernel_shared[(((((int)threadIdx.z) * 64) + 62))];
        kernel_shared_local[(63)] = kernel_shared[(((((int)threadIdx.z) * 64) + 63))];
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(0)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(32)] * kernel_shared_local[(0)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(0)] * kernel_shared_local[(32)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(32)] * kernel_shared_local[(32)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(1)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(33)] * kernel_shared_local[(1)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(1)] * kernel_shared_local[(33)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(33)] * kernel_shared_local[(33)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(2)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(34)] * kernel_shared_local[(2)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(2)] * kernel_shared_local[(34)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(34)] * kernel_shared_local[(34)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(3)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(35)] * kernel_shared_local[(3)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(3)] * kernel_shared_local[(35)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(35)] * kernel_shared_local[(35)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(4)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(36)] * kernel_shared_local[(4)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(4)] * kernel_shared_local[(36)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(36)] * kernel_shared_local[(36)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(5)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(37)] * kernel_shared_local[(5)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(5)] * kernel_shared_local[(37)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(37)] * kernel_shared_local[(37)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(6)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(38)] * kernel_shared_local[(6)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(6)] * kernel_shared_local[(38)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(38)] * kernel_shared_local[(38)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(7)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(39)] * kernel_shared_local[(7)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(7)] * kernel_shared_local[(39)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(39)] * kernel_shared_local[(39)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(8)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(40)] * kernel_shared_local[(8)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(8)] * kernel_shared_local[(40)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(40)] * kernel_shared_local[(40)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(9)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(41)] * kernel_shared_local[(9)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(9)] * kernel_shared_local[(41)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(41)] * kernel_shared_local[(41)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(10)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(42)] * kernel_shared_local[(10)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(10)] * kernel_shared_local[(42)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(42)] * kernel_shared_local[(42)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(11)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(43)] * kernel_shared_local[(11)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(11)] * kernel_shared_local[(43)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(43)] * kernel_shared_local[(43)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(12)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(44)] * kernel_shared_local[(12)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(12)] * kernel_shared_local[(44)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(44)] * kernel_shared_local[(44)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(13)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(45)] * kernel_shared_local[(13)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(13)] * kernel_shared_local[(45)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(45)] * kernel_shared_local[(45)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(14)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(46)] * kernel_shared_local[(14)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(14)] * kernel_shared_local[(46)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(46)] * kernel_shared_local[(46)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(15)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(47)] * kernel_shared_local[(15)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(15)] * kernel_shared_local[(47)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(47)] * kernel_shared_local[(47)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(16)] * kernel_shared_local[(16)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(48)] * kernel_shared_local[(16)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(16)] * kernel_shared_local[(48)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(48)] * kernel_shared_local[(48)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(17)] * kernel_shared_local[(17)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(49)] * kernel_shared_local[(17)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(17)] * kernel_shared_local[(49)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(49)] * kernel_shared_local[(49)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(18)] * kernel_shared_local[(18)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(50)] * kernel_shared_local[(18)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(18)] * kernel_shared_local[(50)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(50)] * kernel_shared_local[(50)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(19)] * kernel_shared_local[(19)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(51)] * kernel_shared_local[(19)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(19)] * kernel_shared_local[(51)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(51)] * kernel_shared_local[(51)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(20)] * kernel_shared_local[(20)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(52)] * kernel_shared_local[(20)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(20)] * kernel_shared_local[(52)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(52)] * kernel_shared_local[(52)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(21)] * kernel_shared_local[(21)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(53)] * kernel_shared_local[(21)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(21)] * kernel_shared_local[(53)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(53)] * kernel_shared_local[(53)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(22)] * kernel_shared_local[(22)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(54)] * kernel_shared_local[(22)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(22)] * kernel_shared_local[(54)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(54)] * kernel_shared_local[(54)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(23)] * kernel_shared_local[(23)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(55)] * kernel_shared_local[(23)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(23)] * kernel_shared_local[(55)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(55)] * kernel_shared_local[(55)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(24)] * kernel_shared_local[(24)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(56)] * kernel_shared_local[(24)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(24)] * kernel_shared_local[(56)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(56)] * kernel_shared_local[(56)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(25)] * kernel_shared_local[(25)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(57)] * kernel_shared_local[(25)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(25)] * kernel_shared_local[(57)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(57)] * kernel_shared_local[(57)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(26)] * kernel_shared_local[(26)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(58)] * kernel_shared_local[(26)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(26)] * kernel_shared_local[(58)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(58)] * kernel_shared_local[(58)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(27)] * kernel_shared_local[(27)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(59)] * kernel_shared_local[(27)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(27)] * kernel_shared_local[(59)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(59)] * kernel_shared_local[(59)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(28)] * kernel_shared_local[(28)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(60)] * kernel_shared_local[(28)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(28)] * kernel_shared_local[(60)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(60)] * kernel_shared_local[(60)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(29)] * kernel_shared_local[(29)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(61)] * kernel_shared_local[(29)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(29)] * kernel_shared_local[(61)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(61)] * kernel_shared_local[(61)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(30)] * kernel_shared_local[(30)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(62)] * kernel_shared_local[(30)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(30)] * kernel_shared_local[(62)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(62)] * kernel_shared_local[(62)]));
        compute_local[(0)] = (compute_local[(0)] + (pad_temp_shared_local[(31)] * kernel_shared_local[(31)]));
        compute_local[(2)] = (compute_local[(2)] + (pad_temp_shared_local[(63)] * kernel_shared_local[(31)]));
        compute_local[(1)] = (compute_local[(1)] + (pad_temp_shared_local[(31)] * kernel_shared_local[(63)]));
        compute_local[(3)] = (compute_local[(3)] + (pad_temp_shared_local[(63)] * kernel_shared_local[(63)]));
      }
    }
  }
  compute[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.z) * 1568)) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + ((int)threadIdx.x)))] = compute_local[(0)];
  compute[(((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.z) * 1568)) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + ((int)threadIdx.x)) + 14))] = compute_local[(2)];
  compute[(((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.z) * 1568)) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + ((int)threadIdx.x)) + 784))] = compute_local[(1)];
  compute[(((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.z) * 1568)) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + ((int)threadIdx.x)) + 798))] = compute_local[(3)];
}

//grid=(7,1,16),  block=(2,28,1)
int main(int argc, char *argv[]){
    dim3 grid(1,14,2);
    dim3 block(14,2,8);
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
