#!/bin/bash

procs=$(ls /proc -1 | grep '[[:digit:]]*' | awk '{print "/proc/" $1}')

mx=0
pid=-1

for proc in $procs
do
	statm=$proc$"/statm"
	cur_mem=$(awk '{print $2}' $statm 2>/dev/null)	
	if [[ $mx -lt $cur_mem ]]; then
		pid=$(echo $proc | cut -b 7-)
		mx=$cur_mem
	fi
done

echo PID=$pid, mem=$mx

