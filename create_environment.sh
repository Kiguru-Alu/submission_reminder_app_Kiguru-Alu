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

# Populate app/reminder.sh
cat <<'EOF' > app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Populate assets/submissions.txt
cat <<EOF > assets/submissions.txt
student, assignment, submission status

Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted

Mahui, Shell Extremely Advanced , submitted
Brian, Git, submitted
Leresi, Shell permissions, not submitted
Lilian, Shell Basics, not submitted
Diana, Shell Navigation, submitted
Grace, Shell Basics, submitted
EOF

# Populate config/config.env
cat <<EOF > config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate modules/functions.sh
cat <<'EOF' > modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

# Populate startup.sh
cat <<'EOF' > startup.sh
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
EOF

# Make all .sh files executable
find . -type f -name "*.sh" -exec chmod +x {} \;

echo "Submission reminder app structure created for $name."