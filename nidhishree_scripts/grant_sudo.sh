#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <user_list_file>"
    exit 1
fi

USER_FILE="$1"
TEMP_FILE="/tmp/sudoers_temp_check"
SUDOERS_FILE="/etc/sudoers"
BACKUP_FILE="/etc/sudoers.bak.$(date +%Y%m%d%H%M%S)"

echo "Backing up original sudoers to $BACKUP_FILE"
sudo cp "$SUDOERS_FILE" "$BACKUP_FILE"

sudo cp "$SUDOERS_FILE" "$TEMP_FILE"

while read -r user
do
    if echo "$user" | grep -E -q '^[[:space:]]*$'; then
        continue
    fi
    if echo "$user" | grep -E -q '^#'; then
        continue
    fi

    if ! id "$user" >/dev/null 2>&1; then
        echo "User $user does not exist. creating..."
        sudo adduser -m "$user"
        if [ $? -ne 0 ]; then
           echo "failed to create $user. skipping."
           continue
        fi
      
        echo "user created successfully"
    fi

    echo "$user ALL=(ALL) ALL" | sudo tee -a "$TEMP_FILE" >/dev/null
done < "$USER_FILE"

echo "Validating temp sudoers..."
sudo visudo -c -f "$TEMP_FILE"
if [ $? -ne 0 ]; then
    echo "Syntax error in temp sudoers file. Aborting."
    exit 1
fi

echo "Appending validated entries to $SUDOERS_FILE"
sudo cp "$TEMP_FILE" "$SUDOERS_FILE"

sudo visudo -c -f "$SUDOERS_FILE"
if [ $? -eq 0 ]; then
    echo "Users successfully added to $SUDOERS_FILE"
else
    echo "ERROR: Final sudoers file has syntax issues! Restoring backup..."
    sudo cp "$BACKUP_FILE" "$SUDOERS_FILE"
    exit 1
fi

