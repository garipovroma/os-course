#!/bin/bash

> top-log.txt


while(true);
do
#	echo "  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND" >> top-log.txt
	top -b -o %MEM -E M -d 1 | head -12 | tail -9 >> top-log.txt
	echo "" >> top-log.txt
	sleep 2 
done
