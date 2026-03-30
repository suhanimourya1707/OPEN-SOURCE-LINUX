#!/bin/bash
# script2_package_inspector.sh
# Author: Suhani Mourya 
# Roll Number: 24bce11160
# Purpose: Check if Git is installed and show details about some FOSS tools

echo "==========================================="
echo "       FOSS PACKAGE INSPECTOR"
echo "==========================================="

# Check if git command exists using 'which' and discard output to /dev/null
if which git > /dev/null 2>&1; then
    echo "[+] Git is installed on this system!"
    
    # Get the version of git
    GIT_VERSION=$(git --version)
    echo "    Version: $GIT_VERSION"
    
    # Using dpkg to get a short package description (Ubuntu/Debian specific)
    # We use grep to find the description line
    if which dpkg > /dev/null 2>&1; then
        echo "    Package info:"
        dpkg -s git | grep -i "^Description:" | head -n 1
    fi
    echo "    License: GNU General Public License version 2.0 (GPLv2)"
else
    echo "[-] Git is NOT installed."
    echo "    To install run: sudo apt-get update && sudo apt-get install git"
fi

echo "-------------------------------------------"
echo "Quick facts about other popular open-source software:"

# Using a case statement to loop through some predefined packages
# We will just pass an arbitrary package to demonstrate case usage
CHECK_PKG="linux"

case $CHECK_PKG in
    "git")
        echo "- Git: A distributed version control system designed for speed."
        ;;
    "linux")
        echo "- Linux: The kernel that started a massive open-source revolution."
        echo "- Python: An interpreted, high-level programming language."
        echo "- Apache HTTP Server: The world's most used web server software."
        ;;
    *)
        echo "- Unknown common FOSS package!"
        ;;
esac
echo "==========================================="

# Note on concepts used:
# - if-then-else to handle installed/not installed outcomes
# - /dev/null redirection to hide command errors or standard output
# - case statement to handle different inputs securely

# Sample Output:
# ===========================================
#        FOSS PACKAGE INSPECTOR
# ===========================================
# [+] Git is installed on this system!
#     Version: git version 2.34.1
#     Package info:
# Description: fast, scalable, distributed revision control system
#     License: GNU General Public License version 2.0 (GPLv2)
# -------------------------------------------
# Quick facts about other popular open-source software:
# - Linux: The kernel that started a massive open-source revolution.
# - Python: An interpreted, high-level programming language.
# - Apache HTTP Server: The world's most used web server software.
# ===========================================
