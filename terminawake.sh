#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# The directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/scripts"

# Include the helper scripts
source "$SCRIPTS_DIR/sleep_control.sh"
source "$SCRIPTS_DIR/sleep_duration.sh"
source "$SCRIPTS_DIR/sleep_abort.sh"
source "$SCRIPTS_DIR/listener.sh"

disable_indefinitely() {
    # Prevent sleep indefinitely for battery and AC power modes when no argument was passed
    disable_sleep

    echo "Sleep disabled indefinitely. Press 'd' to toggle display, 'l' to lock screen, 'r' to enable sleep, or 'q' to quit."
    listen_commands

    # Revert to the default sleep behavior
    enable_sleep
}

disable_temporarily() {
    local duration_sec=$(set_duration "$1")

    # Prevent sleep for the specified duration
    disable_sleep

    echo "Sleep disabled for $1. Press 'd' to toggle display, 'l' to lock screen, 'r' to enable sleep, or 'q' to quit."
    listen_commands

    # Revert to the default sleep behavior
    enable_sleep
}

# Check if an argument was passed
if [[ -z $1 ]]; then
    disable_indefinitely
else
    disable_temporarily "$1"
fi
