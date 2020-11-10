#!/bin/bash

procs=$(ls /proc -1 | grep '[0-9]' | awk '{print "/proc/" $1}')

function get_data() {
	procs=$(ls /proc -1 | grep '[0-9]' | awk '{print "/proc/" $1}')
	local arr=()
	for proc in $procs
	do
        	io=$proc$"/io"
	        bytes=$(awk '{if ($1 == "read_bytes:") print $2}' $io 2>/dev/null)
	        if [[ $bytes -eq "" ]]; then
        	        continue
	        fi
        	pid=$(echo $proc | cut -b 7-)
#		echo $bytes, $pid
	        arr[$pid]=$pid:$bytes
	done
	printf '%s\n' "${arr[@]}" > $1
}


$(get_data data1.txt)

sleep 60

$(get_data data2.txt)

data1=$(cat data1.txt)
data2=$(cat data2.txt)

rm data1.txt
rm data2.txt

diff=()

for str in $data2:
do
	pid=$(echo $str | awk -F ":" '{print $1}')
	bytes=$(echo $str | awk -F ":" '{print $2}')
	diff[$pid]=$bytes
done

for str in $data1:
do
	pid=$(echo $str | awk -F ":" '{print $1}')
        bytes=$(echo $str | awk -F ":" '{print $2}')	
	cmdline=/proc/$pid/cmdline
	line=$(cat $cmdline 2>/dev/null | tr -d '\0')
	if [[ diff[$pid] -ne "" ]]; then
		left=${diff[$pid]}
		right="$bytes"
		cur=$(echo "$left" - "$right" | bc)
		diff[$pid]="$pid:$cur:$line"
	fi
done	

printf '%s\n' "${diff[@]}" | sort -n -k2 -t ":" | tail -n 3
