#!/bin/bash

# Get the directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Include the display control script and the sleep control script
source "$SCRIPTS_DIR/display_control.sh"
source "$SCRIPTS_DIR/sleep_control.sh"

# Instruction string
instructions="'d' - turn off display, 'l' - lock screen, 'r' - toggle sleep, 'q' - enable sleep and quit."

# Function to listen to user commands
listen_commands() {
    
    # Setting terminal to non-canonical mode
    old_stty_cfg=$(stty -g)
    stty raw -echo min 0

    echo "$instructions"
    # Loop for reading commands
    while IFS= read -r -n 1 key; do # -n 1 reads one character at a time without waiting for a newline so the script responds immediately to keystroke. -r prevents backslashes from being interpreted as escape characters
        case "$key" in
            d)  # If 'd', sleep the display
                sleep_display  # Calls the function from display_control.sh
                echo -e "\r\nDisplay turned off. When the display turns off, your lock screen will activates based on the manual 'lock screen' system setting, 'Require password after...'. Setting it to 'immediately' will lock & secure your computer while it stays awake."
                ;;
            r)  # If 'r', toggle system sleep
                toggle_sleep  # Calls the function from sleep_control.sh
                ;;
            t)  # If 't', request sleep timer delay input
                echo -e "\r\nPlease enter sleep timer delay in minutes (or '0' for no delay):"
                read -r delay
                echo -e "\r\nPlease enter display sleep delay in minutes (or '0' for no delay):"
                read -r display_delay
                # Here, add code to apply these delays. You might need to modify terminawake.sh and create additional scripts to handle these values.
                ;;
            l)  # If 'l', there is no pmset equivalent for locking the screen
                echo -e "\r\n'control + command + q' will lock a Mac computer"
                ;;
            q)  # If 'q', break the loop
                echo -e "\r\nEnabling sleep and quitting..."
                break
                ;;
            *)  # For unrecognized keystrokes, print "Unknown command."
                echo -e "\r\nUnknown command."
                ;;
        esac
        sleep 1  # This can be adjusted as needed to hold the message on the screen
        echo -e "\r\n\n$instructions"
    done

    # Restoring terminal settings
    stty "$old_stty_cfg"
}
