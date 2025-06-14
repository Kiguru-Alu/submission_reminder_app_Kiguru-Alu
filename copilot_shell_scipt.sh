#!/bin/bash

# due to directory levels, find out name
read -p "Enter the name used to create the submission_reminder app: " name

# Validate name 
while [[ -z "$name" || "$name" =~ [[:space:]] ]]; do
    echo "Name must not be empty or contain spaces."
    read -p "Enter the name you used to create the submission_reminder app: " name
done

# Set project path
project_dir="submission_reminder_$name"
config_file="$project_dir/config/config.env"
startup_script="$project_dir/startup.sh"

# Check if project directory exists
if [[ ! -d "$project_dir" ]]; then
    echo "❌ Directory '$project_dir' not found!"
    exit 1
fi


read -p "Enter assignment name : " ASSIGNMENT

#validating the input fiels
while [[ -z "$ASSIGNMENT" ]]; do
    echo "Assignment name cannot be empty."
    read -p "Enter assignment name: " ASSIGNMENT
done



# Check if config file exists
if [[ ! -f "$config_file" ]]; then
    echo " config/config.env file not found!"
    exit 1
fi

# Replace the ASSIGNMENT value on line 2 in config.env
sed -i "2s|^ASSIGNMENT=.*|ASSIGNMENT=\"$ASSIGNMENT\"|" "$config_file"

echo "Changed assignment to \"$ASSIGNMENT\" in $config_file"

# Check if startup script exists
if [[ ! -f "$startup_script" ]]; then
    echo " startup.sh not found in $project_dir!"
    exit 1
fi

# Run the reminder app
echo " Running startup.sh..."
bash "$startup_script"