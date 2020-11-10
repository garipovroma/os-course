#!/bin/bash

procs=$(ls /proc -1 | grep '[0-9]' | awk '{print "/proc/" $1}')

#echo "$procs"

for proc in $procs
do
	status=$proc$"/status"
	sched=$proc$"/sched"
	pid=$(grep "Pid:" $status --max-count=1 2>/dev/null | awk '{print $2}') 
	ppid=$(grep "PPid:" $status --max-count=1 2>/dev/null | awk '{print $2}')
	sum_exec_runtime=$(grep "se.sum_exec_runtime" $sched --max-count=1 2>/dev/null | awk '{print $3}')
	nr_switches=$(grep "nr_switches" $sched --max-count=1 2>/dev/null | awk '{print $3}')
	art=$(echo "$sum_exec_runtime" "/" "$nr_switches" | bc -l 2>/dev/null | awk '{printf "%f", $1}')
	if [[ "$art" == "" ]];
       	then
		continue
	fi
	echo "$pid" : "$ppid"  : "$art"

done

