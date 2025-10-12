#!/bin/bash

for arg in $@
do
    if [[ "$arg" =~ ^[0-9]+$ ]]
    then
        echo "$arg"
    fi
done
