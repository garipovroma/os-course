#!/bin/bash

grep -E -o -h -s "\b[A-Za-z0-9._-]+@[A-Za-z0-9-]+\.[A-Za-z]{2,6}\b" -R /etc | awk 'NF == 1' | tr '\n' ', ' | sed 's/,$/\n/' > emails.lst
