#!/bin/bash

#cmd_list=$(ls --ignore='.* '-1a /sbin | tr '\n' ',')#
#ps aux -C $cmd_list

ps aux | awk '$11 ~ /^\/sbin[A-Za-z\/]+/ {print $2 }'
