/* This file is generated by gen_zigzag4.m */

/* clang-format off */

#include "odintrin.h"
OD_EXTERN const unsigned char OD_ZIGZAG4_DCT_DCT[15][2] = {
  {0, 1}, {1, 0}, {1, 1}, {0, 2},
  {2, 0}, {0, 3}, {1, 2}, {3, 0},
  {2, 1}, {1, 3}, {2, 2}, {3, 1},
  {2, 3}, {3, 2}, {3, 3} };

OD_EXTERN const unsigned char OD_ZIGZAG4_ADST_DCT[15][2] = {
  {1, 0}, {0, 1}, {2, 0}, {1, 1},
  {3, 0}, {2, 1}, {0, 2}, {1, 2},
  {3, 1}, {0, 3}, {2, 2}, {1, 3},
  {3, 2}, {2, 3}, {3, 3} };

OD_EXTERN const unsigned char OD_ZIGZAG4_DCT_ADST[15][2] = {
  {0, 1}, {0, 2}, {1, 0}, {0, 3},
  {1, 1}, {1, 2}, {2, 0}, {1, 3},
  {2, 1}, {2, 2}, {3, 0}, {3, 1},
  {2, 3}, {3, 2}, {3, 3} };
