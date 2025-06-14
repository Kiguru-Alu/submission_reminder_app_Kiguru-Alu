#!/bin/bash

# error handling
set -e

echo " Starting the Submission Reminder App..."

# Checking if all required files exist
required_files=(
    "./config/config.env"
    "./modules/functions.sh"
    "./assets/submissions.txt"
    "./app/reminder.sh"
)

for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo " Missing file: $file"
        exit 1
    fi
done

# Make sure all .sh files are executable 
find . -type f -name "*.sh" -exec chmod +x {} \;

# Run the main reminder script
./app/reminder.sh

echo " Reminder check complete."
