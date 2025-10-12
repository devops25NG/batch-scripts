#!/bin/bash

sshlogs=$(sudo grep "sshd" /var/log/secure)

echo "$sshlogs" > /var/log/ssh$(date +"%Y%m%d").log

