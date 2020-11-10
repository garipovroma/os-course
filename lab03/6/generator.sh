#!/bin/bash

while true; do
	read LINE
	case $LINE
		in
		+)
			kill -USR1 $(cat .pid)
			;;
		\*)
			kill -USR2 $(cat .pid)
			;;


		STOP)
			kill -SIGTERM $(cat .pid)
			;;
		*)
			:
			;;
	esac
done
