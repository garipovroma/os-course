#!/bin/bash

q_str='q'
buf=''
read str
while [[ "$str" != "$q_str" ]] 
do
	buf="$buf""$str"
	read str
done

echo "$buf"
