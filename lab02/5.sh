#!/bin/bash

sorted_data=$(./4.sh | sort -k2 -n -t ':')

#echo "$sorted_data"

awk -F ":" '
BEGIN {last=0; cnt=0; avg=0} 
$2 == last { avg=avg + $3; cnt=cnt + 1; last=$2} 
$2 != last {print "Average_Sleeping_Children_of_ParentID="last, "is ", avg/cnt; last=$2; cnt=1; avg=$3} 
END {avg=avg / cnt; print "Average_Sleeping_Children_of_ParentID="last, "is " avg}' <<< $sorted_data

