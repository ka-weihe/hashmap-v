#!/bin/sh
# v -cc clang-9 -cflags "-O3 -march=native" benchmark.v && ./benchmark
# v -cflags -O3 benchmark.v && ./benchmark
v -cc gcc -cflags "-O2 -march=native" benchvs.v && ./benchvs
# v -cc clang-9 -prod -d no_bounds_checking benchvs.v && ./benchvs
