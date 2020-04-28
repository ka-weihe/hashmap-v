#!/bin/sh
v -cc clang-10 -cflags "-O3 -march=native -fsanitize=memory -fsanitize=undefined" -d no_bounds_checking monkeytest.v -o monkeytest_clang
v -cc gcc -cflags "-O3 -march=native -fsanitize=address -fsanitize=undefined" -d no_bounds_checking monkeytest.v -o monkeytest_gcc
for i in $(seq 0 1 5000)
do
  ./monkeytest_clang >> result.txt &
  sleep 0.001
  ./monkeytest_gcc >> result.txt &
  sleep 0.001
  ./monkeytest_clang >> result.txt &
  sleep 0.001
  ./monkeytest_gcc >> result.txt
  sleep 0.001
done

