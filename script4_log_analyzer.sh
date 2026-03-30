#!/bin/bash
# script4_log_analyzer.sh
# Author: Suhani Mourya 
# Roll Number: 24bce11160
# Purpose: Accept a log file path and search for a specific keyword

echo "==========================================="
echo "           LOG FILE ANALYZER"
echo "==========================================="

# Assign arguments to meaningful variables
LOG_FILE=$1
# If $2 is provided, use it, otherwise default to "error"
KEYWORD=${2:-error}

# Check if user provided a file argument
if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <path_to_log_file> [keyword]"
    echo "Example: $0 /var/log/dpkg.log warning"
    exit 1
fi

# Check if file exists and is readable
if [ ! -r "$LOG_FILE" ]; then
    echo "[-] Error: File '$LOG_FILE' is missing or you don't have read permissions."
    # A realistic "retry-like" tip for students:
    echo "    Try running with 'sudo' if it's a restricted system log."
    exit 1
fi

echo "Analyzing file : $LOG_FILE"
echo "Searching for  : '$KEYWORD' (case-insensitive)"
echo "-------------------------------------------"

# Counter for matches
MATCH_COUNT=0
# A temporary variable for capturing output to show at the end
# We'll just read line by line as requested by the assignment
MATCHED_LINES=""

# while-read loop to scan the file line by line
while IFS= read -r line; do
    # Using grep to check if the keyword is in the current line (-i makes it case-insensitive)
    if echo "$line" | grep -iq "$KEYWORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
        
        # Keep track of last 5 matching lines 
        MATCHED_LINES="$MATCHED_LINES$line\n"
    fi
done < "$LOG_FILE"

echo "Total occurrences of '$KEYWORD': $MATCH_COUNT"

if [ "$MATCH_COUNT" -gt 0 ]; then
    echo "-------------------------------------------"
    echo "Last 5 matching lines:"
    echo -e "$MATCHED_LINES" | tail -n 6 | head -n 5
else
    echo "Great! No lines matching '$KEYWORD' were found."
fi

echo "==========================================="

# Note on concepts used:
# - Command line arguments $1 and $2
# - Default variable assignment ${VAR:-default}
# - 'while read' loop to process files line by line
# - Math operations $(( ))

# Sample Output:
# ===========================================
#            LOG FILE ANALYZER
# ===========================================
# Analyzing file : /var/log/dpkg.log
# Searching for  : 'error' (case-insensitive)
# -------------------------------------------
# Total occurrences of 'error': 0
# Great! No lines matching 'error' were found.
# ===========================================
