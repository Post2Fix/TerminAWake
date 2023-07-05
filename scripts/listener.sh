#!/bin/bash

# Get the directory where the helper scripts are located
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Include the display control script and the sleep control script
source "$SCRIPTS_DIR/display_control.sh"
source "$SCRIPTS_DIR/sleep_control.sh"

# Instruction string
instructions="Select option: 1. turn off display, 2. lock screen instructions, 3. toggle sleep, 4. set sleep delay, 5. enable sleep & quit."

# Function to listen to user commands
listen_commands() {
    echo "$instructions"
    # Loop for reading commands
    while IFS= read -e -r key; do # read line by line with editing enabled (delete key deletes instead of printing '^?'). Press retunr to send commands
        case "$key" in
            1)  # Turn off the display
                turn_off_display  # Calls the function from display_control.sh
                echo -e "\r\nDisplay turned off. When the display turns off, your lock screen will activates based on the manual 'lock screen' system setting, 'Require password after...'. Setting it to 'immediately' will lock & secure your computer while it stays awake."
                ;;
            2)  # Present screen locking instructions
                echo -e "\r\nThe macOS setting 'Lock Screen Settings -> 'Require password sfter...' sets how long after the display turns off, a password is required. This can only be configured manually. Alternatively, pressing 'control + command + q' or the power button (sometimes multiple times...), will lock a Mac at any point"
                ;;
            3)  # Toggle sleep
                toggle_sleep  # Calls the function from sleep_control.sh
                ;;
            4)  # Set and display a new sleep delay
                echo -e "\r\nSetting up sleep delay"
                set_timers  # Calls the function from sleep_control.sh
                ;;
            5)  # Enable sleep and break the loop to quit the program
                echo -e "\r\nEnabling sleep and quitting"
                break
                ;;
            *)  # For all other keystrokes, print "Unknown command."
                echo -e "\r\nUnknown command."
                ;;
        esac
        echo -e "\r\n\n$instructions"
    done
}
