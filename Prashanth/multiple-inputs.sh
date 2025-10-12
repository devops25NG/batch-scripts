#!/bin/bash


for arg in "$@"
do
    if echo "$arg" | grep -Eq '^[0-9]+$'; then
        echo "$arg"
    fi
done

