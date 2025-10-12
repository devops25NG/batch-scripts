#!/bin/bash
# Read an integer 'n' and print pattern up to n rows

read -p "Enter a number: " n

for ((i=1; i<=n; i++))
do
  for ((j=1; j<=i; j++))
  do
    echo -n "$j "
  done
  echo
done
#im adding this line to check for git conflicts

echo "$0"
