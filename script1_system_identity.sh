#!/bin/bash
# script1_system_identity.sh
# Author: Suhani Mourya 
# Roll Number: 24bce11160
# Purpose: Display basic system and user information to establish the environment

echo "==========================================="
echo "       SYSTEM IDENTITY REPORT"
echo "==========================================="

# Using command substitution to get the OS info based on /etc/os-release
if [ -f /etc/os-release ]; then
    OS_NAME=$(grep "^PRETTY_NAME" /etc/os-release | cut -d '=' -f 2 | tr -d '"')
else
    OS_NAME=$(uname -s)
fi

KERNEL_VER=$(uname -r)
CURRENT_USER=$USER
USER_HOME=$HOME
SYS_UPTIME=$(uptime -p)
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "Date/Time       : $CURRENT_DATE"
echo "Linux Distro    : $OS_NAME"
echo "Kernel Version  : $KERNEL_VER"
echo "Logged in User  : $CURRENT_USER"
echo "Home Directory  : $USER_HOME"
echo "System Uptime   : $SYS_UPTIME"
echo "-------------------------------------------"

# A small note using variables
MESSAGE="Fun Fact: $OS_NAME is open source and heavily relies on the GPL license!"
echo "$MESSAGE"

echo "==========================================="

# Note on concepts used:
# - Variables to store commands (command substitution `$()`)
# - Environment variables like $USER and $HOME
# - Basic text processing using grep and cut

# Sample Output:
# ===========================================
#        SYSTEM IDENTITY REPORT
# ===========================================
# Date/Time       : 2023-11-20 14:30:00
# Linux Distro    : Ubuntu 22.04.3 LTS
# Kernel Version  : 5.15.0-88-generic
# Logged in User  : Suhani Mourya
# Home Directory  : /home/Suhani Mourya
# System Uptime   : up 2 hours, 15 minutes
# -------------------------------------------
# Fun Fact: Ubuntu 22.04.3 LTS is open source and heavily relies on the GPL license!
# ===========================================
