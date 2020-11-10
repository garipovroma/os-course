#!/bin/bash

({
a=228
b=239
while true;do
	c=$(( a * b ))			
done
}) &
p1=$!

({
c=229
d=240
while true;do
	e=$(( c * d + 2 ))
done
}) &
p2=$!

({
e=230
f=241
while true;do
	g=$(( e * f - 2))			
done
}) &
p3=$!

#while true;do
#	pcpu=$(ps --pid $p1 -o pid,ppid,pcpu,user | awk '{if ($3 != "%CPU" && $3 < 10) print ""; else print 1;}')
#	if [[ ! $pcpu==1 ]];
#       	then
#	renice 2 --pid $p1
#	fi
#
#	sleep 20
#done

#while true; do
#	pcpu=$(ps --pid $p1 -o pid,ppid,pcpu,user | awk '{if ($3 != "%CPU" && $3 < 10) print ""; else print 1;}')
#	if [[ ! $pcpu==1 ]]; then
cpulimit -p $p1 -l 9 -b
#	fi
#	echo $pcpu
#	ps --pid $p1 -o pid,ppid,user
#	sleep 10
#done	

sleep 10		
kill $p3
