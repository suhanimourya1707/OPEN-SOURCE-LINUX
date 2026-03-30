#!/bin/bash
# script3_disk_auditor.sh
# Author: Suhani Mourya 
# Roll Number: 24bce11160
# Purpose: Audit important directories for size and permissions, and check Git config

echo "==========================================="
echo "       DISK AND PERMISSION AUDITOR"
echo "==========================================="

# Define a list of important directories to scan
DIRS="/etc /var/log /home /usr/bin /tmp"

echo "Directory Size & Permissions Scan:"
printf "%-15s %-12s %-25s %s\n" "Size" "Permissions" "Owner:Group" "Directory"
echo "-------------------------------------------------------------------"

# Loop through each directory
for dir in $DIRS; do
    if [ -d "$dir" ]; then
        # du -sh calculates exact size (summarized, human-readable). 2>/dev/null hides errors if permission is denied.
        DIR_SIZE=$(sudo du -sh "$dir" 2>/dev/null | cut -f1 || echo "N/A")
        
        # ls -ld shows folder permissions. AWK grabs fields 1 (perms), 3 (owner), 4 (group).
        PERMS=$(ls -ld "$dir" | awk '{print $1}')
        OWNERSHIP=$(ls -ld "$dir" | awk '{print $3":"$4}')
        
        printf "%-15s %-12s %-25s %s\n" "$DIR_SIZE" "$PERMS" "$OWNERSHIP" "$dir"
    else
        echo "$dir does not exist."
    fi
done

echo "-------------------------------------------"
echo "Git Configuration Check:"

GIT_CONFIG="$HOME/.gitconfig"

if [ -f "$GIT_CONFIG" ]; then
    echo "[+] Found global Git config at: $GIT_CONFIG"
    PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1}')
    echo "    Permissions: $PERMS"
else
    echo "[-] No global Git config found at $GIT_CONFIG."
    echo "    (You might not have run 'git config --global' yet)"
fi
echo "==========================================="

# Note on concepts used:
# - for loop to iterate over multiple paths
# - if [ -d ] to check if directory exists, if [ -f ] for file
# - awk and cut for isolating specific text columns from tool outputs like `ls` and `du`.

# Sample Output:
# ===========================================
#        DISK AND PERMISSION AUDITOR
# ===========================================
# Directory Size & Permissions Scan:
# Size            Permissions  Owner:Group               Directory
# -------------------------------------------------------------------
# 12M             drwxr-xr-x   root:root                 /etc
# 250M            drwxrwxr-x   root:syslog               /var/log
# 1.5G            drwxr-xr-x   root:root                 /home
# 300M            drwxr-xr-x   root:root                 /usr/bin
# 4.0K            drwxrwxrwt   root:root                 /tmp
# -------------------------------------------
# Git Configuration Check:
# [+] Found global Git config at: /home/Suhani Mourya/.gitconfig
#     Permissions: -rw-rw-r--
# ===========================================
