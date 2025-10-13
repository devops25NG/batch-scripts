#!/bin/bash

echo "Enter filename: " 
read file

if [ ! -f "$file" ]; then
    echo "File not found!"
    exit 1
fi

lines=$(wc -l < "$file")

while [ "$lines" -gt 0 ]; do
    sed -n "${lines}p" "$file"
    lines=$((lines - 1))
done
