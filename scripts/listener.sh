#!/bin/bash

# Get the directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Include the display control script and the sleep control script
source "$SCRIPTS_DIR/display_control.sh"
source "$SCRIPTS_DIR/sleep_control.sh"

# Function to listen to user commands
listen_commands() {
    
    # Setting terminal to non-canonical mode
    old_stty_cfg=$(stty -g)
    stty raw -echo min 0

    # Loop for reading commands
    while IFS= read -r -n 1 key; do # -n 1 reads one character at a time without waiting for a newline so the script responds immediately to keystroke. -r prevents backslashes from being interpreted as escape characters
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

    # Restoring terminal settings
    stty "$old_stty_cfg"
}
