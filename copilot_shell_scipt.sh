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

# Path to the config file
CONFIG_FILE="config/config.env"

# Check if config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "❌ config/config.env file not found!"
    exit 1
fi