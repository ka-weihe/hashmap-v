#!/bin/sh
v -cflags -O3 -d no_bounds_checking monkeytest.v
RED='\033[0;32m'
ORANGE='\033[0;33m'
for i in $(seq 0 1 5000)
do
  echo "${RED}Test: ${i}${ORANGE}"
  ./monkeytest &
  sleep 0.001
  ./monkeytest &
  sleep 0.001
  ./monkeytest &
  sleep 0.001
  ./monkeytest
  sleep 0.001
done
