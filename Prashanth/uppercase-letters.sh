#!/bin/bash

echo "Enter the file name"
read file


if [ -f "$file" ]; then
    newname=$(echo "$file" | tr 'A-Z' 'a-z')
    
    mv "$file" "$newname"
    
    echo "The given input $file has been renamed to $newname (lowercase)"
else
    echo "The given $file is not available"
fi

