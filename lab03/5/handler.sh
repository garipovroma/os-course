#!/bin/bash

operation=+
accumulator=1

(tail -f pipe) |
while true; do
	read LINE;
	case $LINE in
		"+")
			operation=$LINE
			accumulator=0
			;;
		"*")
			operation=$LINE
			accumulator=1
			;;
		QUIT)
			echo "exit"
			killall tail
			exit
			;;
		*)
			if [[ $LINE =~ [0-9]+  ]];
			then
				accumulator=$(( accumulator $operation $LINE ))
			else
				echo $LINE
			fi
			;;

	esac
	echo $accumulator
done
