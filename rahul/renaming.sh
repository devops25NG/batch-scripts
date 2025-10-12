#!/bin/bash

echo "Enter the file or directory name"
read Name

if [ ! -e "$Name" ]; then
    echo "Error: '$Name' does not exist."
    exit 1
fi

New_Name=$(echo "$Name" | tr '[:upper:]' '[:lower:]')

mv "$Name" "$New_Name"

echo "Renamed '$Name' to '$New_Name'"

