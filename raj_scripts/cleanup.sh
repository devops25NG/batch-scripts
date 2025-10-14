#!/bin/bash

# Script to clean up temporary files and free disk space
# Author: Rajashekar JM
# Purpose: Remove old temporary files, logs, and cached data

# Configuration
LOG_FILE="/var/log/disk_cleanup.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Define directories to clean
TMP_DIRS="/tmp /var/tmp"
LOG_DIR="/var/log"

# Age thresholds (in days)
TMP_FILE_AGE=7          # Remove temp files older than 7 days
LOG_FILE_AGE=30         # Remove log files older than 30 days
CACHE_FILE_AGE=14       # Remove cache files older than 14 days

# Size threshold for empty files
EMPTY_FILES=true        # Set to true to delete zero-length files

# Color codes for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to log messages
log_message() {
    echo -e "${GREEN}[${TIMESTAMP}]${NC} $1" | tee -a "$LOG_FILE"
}

log_warning() {
    echo -e "${YELLOW}[${TIMESTAMP}] WARNING:${NC} $1" | tee -a "$LOG_FILE"
}

log_error() {
    echo -e "${RED}[${TIMESTAMP}] ERROR:${NC} $1" | tee -a "$LOG_FILE"
}

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    log_error "This script must be run as root or with sudo privileges"
    exit 1
fi

# Function to display disk space
show_disk_space() {
    echo -e "${BLUE}Current Disk Usage:${NC}"
    df -h / /tmp /var | grep -v "Filesystem"
    echo ""
}

# Function to clean temporary directories
clean_temp_dirs() {
    log_message "Starting cleanup of temporary directories..."
    
    for dir in $TMP_DIRS; do
        if [ -d "$dir" ]; then
            log_message "Cleaning directory: $dir"
            
            # Count files before cleanup
            files_before=$(find "$dir" -type f 2>/dev/null | wc -l)
            
            # Delete regular files older than specified days
            echo -e "${YELLOW}Removing files older than $TMP_FILE_AGE days from $dir${NC}"
            find "$dir" -depth -type f -mtime +$TMP_FILE_AGE -print -delete 2>/dev/null
            
            # Delete old symbolic links
            echo -e "${YELLOW}Removing old symbolic links from $dir${NC}"
            find "$dir" -depth -type l -mtime +$TMP_FILE_AGE -print -delete 2>/dev/null
            
            # Delete old sockets
            echo -e "${YELLOW}Removing old sockets from $dir${NC}"
            find "$dir" -depth -type s -mtime +$TMP_FILE_AGE -size 0 -print -delete 2>/dev/null
            
            # Delete empty files if enabled
            if [ "$EMPTY_FILES" = true ]; then
                echo -e "${YELLOW}Removing empty files from $dir${NC}"
                find "$dir" -depth -type f -empty -print -delete 2>/dev/null
            fi
            
            # Delete empty directories (except lost+found)
            echo -e "${YELLOW}Removing empty directories from $dir${NC}"
            find "$dir" -depth -mindepth 1 -type d -empty ! -name 'lost+found' -print -delete 2>/dev/null
            
            # Count files after cleanup
            files_after=$(find "$dir" -type f 2>/dev/null | wc -l)
            files_removed=$((files_before - files_after))
            
            log_message "Removed $files_removed files from $dir"
        else
            log_warning "Directory $dir does not exist, skipping..."
        fi
    done
}

# Function to clean old log files
clean_log_files() {
    log_message "Starting cleanup of old log files..."
    
    if [ -d "$LOG_DIR" ]; then
        # Remove old compressed log files
        echo -e "${YELLOW}Removing compressed logs older than $LOG_FILE_AGE days${NC}"
        find "$LOG_DIR" -type f \( -name "*.gz" -o -name "*.bz2" -o -name "*.xz" \) -mtime +$LOG_FILE_AGE -print -delete 2>/dev/null
        
        # Remove old rotated log files
        echo -e "${YELLOW}Removing old rotated logs${NC}"
        find "$LOG_DIR" -type f -name "*.log.*" -mtime +$LOG_FILE_AGE -print -delete 2>/dev/null
        
        # Truncate large active log files (optional - commented out by default)
        # Uncomment the following lines to truncate logs larger than 100MB
        # echo -e "${YELLOW}Truncating large log files${NC}"
        # find "$LOG_DIR" -type f -name "*.log" -size +100M -exec truncate -s 10M {} \; -print
        
        log_message "Log file cleanup completed"
    else
        log_warning "Log directory $LOG_DIR does not exist"
    fi
}

# Function to clean package manager cache
clean_package_cache() {
    log_message "Starting cleanup of package manager cache..."
    
    # Detect package manager and clean cache
    if command -v apt-get &> /dev/null; then
        echo -e "${YELLOW}Cleaning APT cache${NC}"
        apt-get clean 2>&1 | tee -a "$LOG_FILE"
        apt-get autoclean 2>&1 | tee -a "$LOG_FILE"
        
        # Remove old package lists
        find /var/cache/apt/archives -type f -name "*.deb" -mtime +$CACHE_FILE_AGE -delete 2>/dev/null
        
    elif command -v yum &> /dev/null; then
        echo -e "${YELLOW}Cleaning YUM cache${NC}"
        yum clean all 2>&1 | tee -a "$LOG_FILE"
        
    elif command -v dnf &> /dev/null; then
        echo -e "${YELLOW}Cleaning DNF cache${NC}"
        dnf clean all 2>&1 | tee -a "$LOG_FILE"
    fi
    
    log_message "Package cache cleanup completed"
}

# Function to clean systemd journal logs
clean_journal_logs() {
    log_message "Starting cleanup of systemd journal logs..."
    
    if command -v journalctl &> /dev/null; then
        echo -e "${YELLOW}Cleaning journal logs older than 30 days${NC}"
        journalctl --vacuum-time=30d 2>&1 | tee -a "$LOG_FILE"
        
        echo -e "${YELLOW}Limiting journal size to 500M${NC}"
        journalctl --vacuum-size=500M 2>&1 | tee -a "$LOG_FILE"
        
        log_message "Journal log cleanup completed"
    else
        log_warning "journalctl not found, skipping journal cleanup"
    fi
}

# Function to clean user cache directories
clean_user_cache() {
    log_message "Starting cleanup of user cache directories..."
    
    # Clean thumbnail cache for all users
    echo -e "${YELLOW}Cleaning user thumbnail caches${NC}"
    find /home/*/.cache/thumbnails -type f -mtime +30 -delete 2>/dev/null
    
    # Clean browser caches (optional - be careful with this)
    # Uncomment if needed:
    # find /home/*/.cache/mozilla -type f -mtime +30 -delete 2>/dev/null
    # find /home/*/.cache/google-chrome -type f -mtime +30 -delete 2>/dev/null
    
    log_message "User cache cleanup completed"
}

# Function to clean core dumps
clean_core_dumps() {
    log_message "Starting cleanup of core dumps..."
    
    # Find and remove core dump files
    echo -e "${YELLOW}Removing core dump files${NC}"
    find /var/crash -type f -name "core.*" -mtime +7 -delete 2>/dev/null
    find /tmp -type f -name "core.*" -mtime +7 -delete 2>/dev/null
    find / -maxdepth 2 -type f -name "core" -mtime +7 -delete 2>/dev/null
    
    log_message "Core dump cleanup completed"
}

# Main execution
echo ""
echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}   Disk Cleanup Script Started${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""

log_message "Disk cleanup process initiated"

# Show disk space before cleanup
show_disk_space

# Perform cleanup operations
clean_temp_dirs
echo ""

clean_log_files
echo ""

clean_package_cache
echo ""

clean_journal_logs
echo ""

clean_user_cache
echo ""

clean_core_dumps
echo ""

# Show disk space after cleanup
log_message "Cleanup operations completed"
echo -e "${GREEN}Disk space after cleanup:${NC}"
show_disk_space

# Summary
echo ""
echo -e "${GREEN}================================================${NC}"
echo -e "${GREEN}   Disk Cleanup Completed Successfully!${NC}"
echo -e "${GREEN}================================================${NC}"
echo -e "Log file saved at: $LOG_FILE"
echo ""

log_message "Disk cleanup script finished successfully"

exit 0

