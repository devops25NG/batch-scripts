#!/bin/bash
# Script to print arguments in reverse order

# Check if any arguments are passed
if [ $# -eq 0 ]; then
  echo "Usage: $0 <arg1> <arg2> ... <argN>"
  exit 1
fi

# Store arguments in an array
args=("$@")

# Print in reverse order
for (( i=$#-1; i>=0; i-- ))
do
  echo "${args[i]}"
done
