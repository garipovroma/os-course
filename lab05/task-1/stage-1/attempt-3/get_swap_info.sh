#!/bin/bash

grep "MiB Swap: " top-log.txt | awk '{print $5}' > swap_info.txt

