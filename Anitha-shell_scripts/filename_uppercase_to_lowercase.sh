#!/bin/bash
echo "Enter file or directory name:"
read name

lower=$(echo "$name" | tr 'A-Z' 'a-z')  # convert to lowercase
mv "$name" "$lower"                      # rename
echo "Renamed '$name' to '$lower'"

