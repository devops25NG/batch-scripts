#!/bin/bash
# Script to rename a file or directory to lowercase

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename or directory>"
    exit 1
fi

item=$1

# Check if the file or directory exists
if [ ! -e "$item" ]; then
    echo "Error: '$item' does not exist!"
    exit 1
fi

# Convert the name to lowercase
lowercase_name=$(echo "$item" | tr 'A-Z' 'a-z')

# Rename only if the new name is different
if [ "$item" != "$lowercase_name" ]; then
    mv "$item" "$lowercase_name"
    echo "Renamed '$item' → '$lowercase_name'"
else
    echo "No uppercase letters found in '$item'. No renaming needed."
fi
