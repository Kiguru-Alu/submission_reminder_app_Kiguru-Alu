#!/bin/bash
read -p "Enter your name(one) please : " name

subfolders=("app" "modules" "assets" "config")
subfolderloop() {
        for subfolder in "${subfolders[@]}"; do
                  mkdir -p "$subfolder"
                 echo "Created subfolder: $subfolder"
         done
}
mkdir submission_reminder_$name && cd submission_reminder_$name && subfolderloop