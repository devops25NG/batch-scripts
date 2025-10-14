## Disk Cleanup Script

**File:** `cleanup.sh`

Automatically cleans temporary files, old logs, and cached data to free disk space on Linux systems.

### Features
- Removes old temporary files from `/tmp` and `/var/tmp` (7+ days)
- Cleans old log files and compressed logs (30+ days)
- Vacuums systemd journal logs
- Removes user cache and thumbnail files
- Cleans core dumps and empty files
- Shows disk usage before/after cleanup
- Comprehensive logging to `/var/log/disk_cleanup.log`


### Usage
Schedule weekly (Sunday 3 AM)
0 3 * * 0 /usr/local/bin/cleanup.sh

### Safety
- Requires root/sudo privileges
- Preserves active files and system directories
- Preview mode: Replace `-delete` with `-print` in find commands
- Always backup important data before running
