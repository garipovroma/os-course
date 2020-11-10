#!/bin/bash

sort -n -t ':' -k3 /etc/passwd | awk -F ':' '{print $1, $3}'
