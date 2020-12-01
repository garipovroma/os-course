#!/bin/bash

# collecting information
RAM_SIZE=$(cat /proc/meminfo | grep -i "MemTotal" | echo $(awk '{print $2}')"/ 1024" | bc)" mB"
SWAP_SIZE=$(cat /proc/swaps | tail -1 | echo $(awk '{print $3}') "/ 1024" | bc)" mB"
PAGE_SIZE=$(getconf PAGE_SIZE)" kB"
RAM_AVAILABLE_SIZE=$(cat /proc/meminfo | grep -i "MemAvailable" | echo $(awk '{print $2}')"/ 1024" | bc)" mB"
SWAP_AVAILABLE_SIZE=$(cat /proc/meminfo | grep -i "SwapFree" | echo $(awk '{print $2}')"/ 1024" | bc)" mB"

echo RAM_SIZE = $RAM_SIZE
echo SWAP_SIZE = $SWAP_SIZE
echo PAGE_SIZE = $PAGE_SIZE
echo RAM_AVAILABLE_SIZE = $RAM_AVAILABLE_SIZE
echo SWAP_AVAILABLE_SIZE = $SWAP_AVAILABLE_SIZE



