#!/bin/bash

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Invalid number of arguments."
    exit 1
fi

writefile="$1"
writestr="$2"

# Check if writefile and writestr are provided
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: File path or content not specified."
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write content to the file
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: File could not be created."
    exit 1
fi

echo "File '$writefile' created with content '$writestr'."

