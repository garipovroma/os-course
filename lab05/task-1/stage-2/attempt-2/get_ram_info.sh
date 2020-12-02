#!/bin/bash

grep "MiB Mem : " top-log.txt | awk '{print $6}' > ram_info.txt

