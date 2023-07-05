#!/bin/bash

# Get the directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Include the sleep_control script
source "$SCRIPTS_DIR/sleep_control.sh"

# Function to abort sleep
abort_sleep() {
    local duration_sec=$1
    sleep "$duration_sec" # Sleep script delay

    # After sleep duration, enable sleep
    enable_sleep
    echo -e "\r\nSleep enabled."
}
