#!/bin/bash
if [[ "$1" -le "$2" && "$2" -le "$3" ]]
then echo "$3"
elif [[ "$1" -le "$3" && "$3" -le "$2" ]]
then echo "$2"
elif [[ "$2" -le "$1" && "$1" -le "$3" ]]
then echo "$3"
elif [[ "$2" -le "$3" && "$3" -le "$1" ]]
then echo "$1"
elif [[ "$3" -le "$1" && "$1" -le "$2" ]]
then echo "$2"
elif [[ "$3" -le "$2" && "$2" -le "$1" ]]
then echo "$1"
fi

