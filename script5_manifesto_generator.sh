#!/bin/bash
# script5_manifesto_generator.sh
# Author: Suhani Mourya 
# Roll Number: 24bce11160
# Purpose: Interactively generate a personalized open source philosophy document

echo "==========================================="
echo "    OPEN SOURCE MANIFESTO GENERATOR"
echo "==========================================="
echo "Let's create a personalized text file for your capstone project!"

# Ask the user a few interactive questions using read
read -p "1. What is your first name? " USER_FIRST_NAME
read -p "2. Why do you like open-source software? (Short sentence): " OSS_REASON
read -p "3. What is your favorite Linux command? (e.g., ls, grep, git): " FAV_CMD

# Define the output file name
OUTPUT_FILE="manifesto_${USER_FIRST_NAME,,}.txt"

echo "-------------------------------------------"
echo "Generating your manifesto at: $OUTPUT_FILE ..."

# Write content into the file using > (overwrite) and >> (append)
echo "-------------------------------------------" > "$OUTPUT_FILE"
echo "   OPEN SOURCE MANIFESTO BY $USER_FIRST_NAME" >> "$OUTPUT_FILE"
echo "-------------------------------------------" >> "$OUTPUT_FILE"
echo "Generated on: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "I believe in open-source software because $OSS_REASON." >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "If I had to use only one terminal tool for the rest of my life," >> "$OUTPUT_FILE"
echo "it would be '$FAV_CMD'." >> "$OUTPUT_FILE"
echo "-------------------------------------------" >> "$OUTPUT_FILE"

# Provide a hint about aliases
echo -e "\nTip: You can create an alias to view this file quickly!" >> "$OUTPUT_FILE"
echo "Example: alias mymanifesto='cat ~/$OUTPUT_FILE'" >> "$OUTPUT_FILE"

echo "[SUCCESS] File created!"
echo "Here is what it looks like inside:"
echo "-------------------------------------------"
cat "$OUTPUT_FILE"
echo "==========================================="

# Note on concepts used:
# - `read -p` to prompt the user for interactive input
# - `,,` parameter expansion to make the username lowercase for the filename
# - `>` to create/overwrite a file, `>>` to append to it.

# Sample Output:
# ===========================================
#     OPEN SOURCE MANIFESTO GENERATOR
# ===========================================
# Let's create a personalized text file for your capstone project!
# 1. What is your first name? Suhani Mourya
# 2. Why do you like open-source software? (Short sentence): it is free and allows you to learn from others' code
# 3. What is your favorite Linux command? (e.g., ls, grep, git): git commit
# -------------------------------------------
# Generating your manifesto at: manifesto_Suhani Mourya.txt ...
# [SUCCESS] File created!
# Here is what it looks like inside:
# ... (prints the text file)
