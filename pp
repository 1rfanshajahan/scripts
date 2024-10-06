#!/bin/bash

# ANSI color codes for visual feedback
GREEN='\033[1;32m'   # Light green for success
RED='\033[1;31m'     # Light red for error
WHITE='\033[1;37m'   # White for text
NC='\033[0m'         # No Color

# Symbols and emojis
CHECK_MARK='✓'       # Check mark symbol
SAD_EMOJI='😞'        # Sad emoji

# Function to print a centered message with decoration
print_centered() {
    columns=$(tput cols)
    message="$1"
    padding="$(printf '%0.1s' ' '{1..500})"
    printf "\n${WHITE}${padding:${#message}/2}${NC}\n"
    printf "${WHITE}${message}${NC}\n"
    printf "${WHITE}${padding:${#message}/2}${NC}\n"
}

# Check if correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo -e "${RED}Error:${NC} Usage: $0 <input_file.cpp>"
    exit 1
fi

# Get input file name
input_file="$1"

# Check if the input file ends with .cpp
if [[ ! "$input_file" =~ \.cpp$ ]]; then
    echo -e "${RED}Error:${NC} Input file must have a .cpp extension."
    exit 1
fi

# Generate output file name without .cpp extension
output_file="${input_file%.cpp}"

# Compile the C++ source file
g++ "$input_file" -o "$output_file"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    print_centered "${GREEN}${CHECK_MARK} Done! ٩(◕‿◕)۶ "
else
    echo -e "${RED}Error:${NC} Check kode (⌣́_⌣̀)"
fi

