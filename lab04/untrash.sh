#!/bin/bash

data=$(awk '{printf("%s:%d\n", $1, $2)}' ~/.trash.log | tac)
#echo "$data"

num=$(wc -l < ~/.trash.log)
#echo $num

for line in $data;
do
	new_num=$(echo $num - 1 | bc)
	path=$(echo $line | awk -F ":" '{print $1}')
	id=$(echo $line | awk -F ":" '{print $2}')
	trash_file_exists=$(test -e ~/.trash/$id && echo "1")
	if [[ $trash_file_exists != 1 ]]; then
		continue;
	fi
	cur_dir=$(pwd)
	if [[ $path =~ .*$1$ ]]; then
		echo $line
		read ans
		if [[ $ans == y || $ans == yes ]]; then
			trash_file_dir=$(echo $path | rev | cut -d"/" -f 2- | rev)
			directory=$( ( (echo $path | rev | cut -d"/" -f 2- | rev ) && test -d) || ("~/") )  
			if [[ $directory == ~/ ]]; then
				echo directory not found, using ~/
			fi
			file_name=$1
			while :
			do	
				status=$(ln ~/.trash/$id $file_name && echo "1")
				if [[ $status == 1 ]]; then
					rm ~/.trash/$id
					break;
				else
					echo this file already exist, write new name for this file:
					read file_name			
				fi


			done

			
		fi
	fi
	num=$new_num
done
