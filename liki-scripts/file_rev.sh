#!/bin/bash
# Script to display file contents in reverse order without using tac

# Check if a filename is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

file=$1

# Check if file exists
if [ ! -f "$file" ]; then
  echo "Error: File '$file' not found!"
  exit 2
fi

# Read file into an array
mapfile -t lines < "$file"

# Print lines in reverse order
for (( i=${#lines[@]}-1; i>=0; i-- )); do
  echo "${lines[i]}"
done

