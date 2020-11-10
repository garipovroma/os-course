#!/bin/bash

#echo "$#"

arr=("$@")

if [[ "$#" -lt  10 ]]
then 
	for ((i = 0; i < "$#"; i++)) 
	do
		echo parametr_"$i" = ${arr["$i"]}
	done
else
echo "Too much arguments"
fi
