#!/bin/bash
read -p "Enter your name(one) please: "  name

# Input validation loop
while [[ -z "$name" || "$name" =~ [[:space:]] ]]; do
    echo "Invalid input. Name must not be empty or contain spaces."
    echo "Enter your name (one word, no spaces) please:"
    read name
done

subfolders=("app" "modules" "assets" "config")
subfolderloop() {
        for subfolder in "${subfolders[@]}"; do
                  mkdir -p "$subfolder"
                 echo "Created subfolder: $subfolder"
         done
}
mkdir submission_reminder_$name && cd submission_reminder_$name

subfolderloop

#to be populated here, during initialization
touch app/reminder.sh
touch modules/functions.sh
touch assets/submissions.txt
touch config/config.env
touch startup.sh

# Making all .sh files executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo "Submission reminder app structure created for $name."