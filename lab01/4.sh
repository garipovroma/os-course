#!/bin/bash
if [[ $PWD == $HOME ]]
then 
	echo "$HOME"
	exit 0
else
	echo $"Error, run script from home directory"
	exit 1
fi
