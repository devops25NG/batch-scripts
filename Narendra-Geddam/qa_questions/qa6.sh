#!/bin/bash

arcfile="/var/log/rlogs_$(date +"%Y%m%d").tar.gz"

# Archive all old logs at once safely
find /var/log/ -type f -mtime +7 -print0 2>/dev/null | tar --null -czf "$arcfile" --files-from=-

