#!/bin/bash

# terminawake.sh
echo "Starting TerminAwake..."

# Path of the script directory
SCRIPT_DIR=$(dirname "$0")

# Set duration
"${SCRIPT_DIR}/sleep_duration.sh" "$1"

# Disable sleep
"${SCRIPT_DIR}/sleep_control.sh" disable

# Start listening for user input
"${SCRIPT_DIR}/listener.sh"

echo "TerminAwake has stopped."
