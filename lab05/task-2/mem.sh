#!/bin/bash

cnt=0
k=9
size_parametr=23840000

for i in {1..30} 
do

	({
	./newmem.sh $size_parametr
	}) &
	sleep 1
done
