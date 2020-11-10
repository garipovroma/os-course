#!/bin/bash

menu_text=$'########--->Menu<---########\n1)nano\n2)vi\n3)links\n4)quit'
while true
do
	echo "$menu_text"
	read choice
	case "$choice" in 
		$'1' ) nano;;
		$'2' ) vi;;
		$'3' ) links;;
		$'4' ) break;;
	esac
done
