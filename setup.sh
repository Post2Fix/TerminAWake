#!/bin/bash

# Directory of the script itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# List of all script files
scripts=("terminawake.sh" "scripts/display_control.sh" "scripts/lock_control.sh" "scripts/sleep_abort.sh" "scripts/sleep_control.sh" "scripts/sleep_duration.sh" "scripts/user_input.sh")

# Loop over all scripts, making them executable
for script in "${scripts[@]}"; do
    chmod +x "$DIR/$script"
done
