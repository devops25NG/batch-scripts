#!/bin/bash
# Script to display file contents in reverse order (without tac)

# Check if a filename is passed as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file=$1

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi

# Display lines in reverse order using awk
awk '{ line[NR] = $0 } END { for (i = NR; i > 0; i--) print line[i] }' "$file"
