#!/bin/bash
# Script to print a number pattern up to n rows

# Read input from user
read -p "Enter number of rows: " n

num=1  # starting number

# Outer loop for rows
for (( i=1; i<=n; i++ ))
do
  # Inner loop for columns
  for (( j=1; j<=i; j++ ))
  do
    echo -n "$num "
    ((num++))
  done
  echo  # new line after each row
done
