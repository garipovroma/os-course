#!/bin/bash

ps a -Ao user,pid | awk -v name="$1" '{if ($1 == name) print $0}' | wc -l

ps a -Ao pid,command -u $1 | awk '{print $1 ":" $2}'
