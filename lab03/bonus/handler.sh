#!/bin/bash

echo $$ > .pid
A=1
usr1()
{
	A=$(( A + 2 ))
}

usr2()
{
	A=$(( A*2 ))
}

usr3()
{
	A=$(( A - 2 ))
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'usr3' SIGRTMIN
while true; do
	echo $A
	sleep 1
done
