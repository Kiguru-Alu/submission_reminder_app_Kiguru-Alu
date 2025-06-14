Individual summative - Linux


Submission Reminder App
A Bash-based reminder system that helps track which students have not submitted a specific assignment. The app reads from a submissions.txt file, filters based on assignment and submission status, and displays reminders.

Project Structure
submission_reminder_<name>/
├── app/
│   └── reminder.sh             # Main script to run the reminder
├── modules/
│   └── functions.sh            # Contains helper functions
├── config/
│   └── config.env              # Stores ASSIGNMENT and DAYS_REMAINING
├── assets/
│   └── submissions.txt         # Data file of students and their submissions
├── startup.sh                  # Launches the app safely

Initialization
Initialize the app structure by running 'create.environment.sh'
The files are populated during initialization


Run app
cd submission_reminder_<name>
run
bash startup.sh or./startup.sh
This loads config values, checks the submissions file, and prints reminders for students who haven’t submitted the specified assignment.

Update assignment via copilot script:

From the parent directory, run:
bash copilot_shell_script.sh
Prompts for:
The <name> used in submission_reminder_<name>
The new assignment name
Automatically updates config.env
Reruns the reminder app

