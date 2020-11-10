#!/bin/bash

man bash | tr -sc [:alpha:] '\n' | awk '{if (length($1) >= 4) print $1}' | sort | uniq -c | sort -nr | head -n3 | awk '{print $2}'
