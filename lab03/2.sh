#!/bin/bash

(sleep 5; ./1.sh) & (tail -f ~/report) |
while true;
do
	read LINE;
	echo $LINE
done
