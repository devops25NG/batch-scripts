#!/bin/bash

read -p "Enter file or directory name: " name

# Convert to lowercase using bash parameter expansion
lower_name="${name,,}"

# Rename the file/directory
mv "$name" "$lower_name"

echo "Renamed: $name → $lower_name"

