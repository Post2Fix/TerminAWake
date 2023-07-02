#!/bin/bash

# Get the directory where the helper scripts are located
# $(dirname "$0") gets the current script directory
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Include the display control script and the sleep control script
source "$SCRIPTS_DIR/display_control.sh"
source "$SCRIPTS_DIR/sleep_control.sh"

# Function to listen to user commands
listen_commands() {
    stty -icanon -echo min 1 time 0  # Change terminal settings to enable immediate character input

    while true; do  # Run indefinitely
        read -r key  # Read a single character from user input
        case "$key" in
            d)  # If 'd', sleep the display
                sleep_display  # Calls the function from display_control.sh
                ;;
            l)  # If 'l', there is no pmset equivalent for locking the screen
                ;;
            r)  # If 'r', enable system sleep
                enable_sleep  # Calls the function from sleep_control.sh
                ;;
            q)  # If 'q', break the loop
                echo "Quitting..."
                break
                ;;
            *)  # If anything else, print "Unknown command."
                echo "Unknown command."
                ;;
        esac
    done

    stty sane  # Reset terminal settings to default
}
