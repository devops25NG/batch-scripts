#!/bin/bash
echo -n "The integer arguments are: "
# Loop through all arguments
for arg in "$@"
do
  # Check if argument is an integer
  if [[ $arg =~ ^[0-9]+$ ]]; then
    echo -n "$arg "
  fi
done
echo ""  # Move to next line

