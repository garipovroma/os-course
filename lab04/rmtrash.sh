#!/bin/bash

if [[ $# == 0 ]]; then
	echo there is no arguments in input
	exit 0
fi

test -d ~/.trash || mkdir ~/.trash

num=$( (test -e ~/.trash/.num && cat ~/.trash/.num) || echo "0")
let "new_num = $num + 1"
echo $new_num > ~/.trash/.num

ln "$1" ~/.trash/$num
deleted_file=$(pwd)/"$1"

echo $deleted_file $num >> ~/.trash.log

rm "$deleted_file"
