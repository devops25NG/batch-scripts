#!/bin/bash

#the command we use for deleating temp files

find /tmp -type f -mtime +1 -exec rm -f {} \;
