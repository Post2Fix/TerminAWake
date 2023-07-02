#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run using sudo"
  exit
fi

# The directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/scripts"

# Include the helper scripts
source "$SCRIPTS_DIR/sleep_control.sh"
source "$SCRIPTS_DIR/sleep_duration.sh"
source "$SCRIPTS_DIR/sleep_abort.sh"

disable_indefinitely() {
    # Prevent sleep indefinitely for battery and AC power modes when no argument was passed
    disable_sleep

    echo "Sleep disabled indefinitely. Press Enter to re-enable sleep."
    # Wait for user to exit the program to reenable sleep
    read -r

    # Revert to the default sleep behavior
    enable_sleep
}

disable_temporarily() {
    local duration_sec=$(set_duration "$1")

    # Prevent sleep for the specified duration
    disable_sleep

    # When the script gets interrupted, ensure the enable_sleep function gets called
    trap enable_sleep INT

    # Sleep for the specified duration
    echo "Sleep disabled for $1. Press Enter to re-enable sleep."
    abort_sleep "$duration_sec" || true

    # Revert to the default sleep behavior
    enable_sleep

    # Remove the trap
    trap - INT
}

# Check if an argument was passed
if [[ -z $1 ]]; then
    disable_indefinitely
else
    disable_temporarily "$1"
fi
