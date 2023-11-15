#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir exists and is a directory
if ! [ -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory or doesn't exist."
    exit 1
fi

# Find matching lines in files
num_files=$(find "$filesdir" -type f | wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

