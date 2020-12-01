#!/bin/bash

(test -e report2.log || touch report2.log) && > report2.log

arr=()
cnt=0
size=0

while :; do
	arr+=(1 2 3 4 5 6 7 8 9 10)
	cnt=$(( $cnt + 1 ))
	size=$(( $size + 10 ))
	if [[ "$cnt" == 10000 ]]; then
		echo $size >> report2.log
		cnt=0
	fi
done
