#!/bin/bash

echo "Enter file or directory name:"
read name

if [ ! -e "$name" ]; then
    echo "Error: '$name' does not exist."
    exit 1
fi

lower=$(echo "$name" | tr 'A-Z' 'a-z')

if [ "$name" != "$lower" ]; then
    mv "$name" "$lower"
    echo "Renamed to: $lower"
else
    echo "Name is already lowercase."
fi
