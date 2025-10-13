#!/bin/bash
# Script to print pattern up to n rows

# Read input from user
read -p "Enter number of rows: " n

# Outer loop for rows
for (( i=1; i<=n; i++ ))
do
  # Inner loop for numbers in each row
  for (( j=1; j<=i; j++ ))
  do
    echo -n "$j "
  done
  echo  # move to next line
done
