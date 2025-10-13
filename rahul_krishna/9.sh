#!/bin/bash

echo "Enter arguments separated by space:"
read input

echo "The integer arguments are:"
for arg in $input; do
    if [[ "$arg" =~ ^[0-9]+$ ]]; then
        echo "$arg"
    fi
done
