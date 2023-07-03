#!/bin/bash

# Check if the script is run with sudo
# EUID is an environment variable representing effective user id
if [ "$EUID" -ne 0 ]
  then echo -e "\r\nPlease run as root"
  exit
fi

# Get the directory where the helper scripts are located
# $(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd) gets the current script directory
# scripts is appended to get the location of the scripts folder
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/scripts"

# Include the helper scripts
source "$SCRIPTS_DIR/sleep_control.sh"  # Contains functions to disable/enable system sleep
source "$SCRIPTS_DIR/sleep_duration.sh"  # Contains function to set sleep duration
source "$SCRIPTS_DIR/display_control.sh"  # Contains function to sleep the display
source "$SCRIPTS_DIR/listener.sh"  # Contains function to listen to user commands
source "$SCRIPTS_DIR/sleep_abort.sh"  # Contains function to abort sleep

# This function disables system sleep indefinitely
disable_indefinitely() {
    disable_sleep  # Calls the function from sleep_control.sh
    echo -e "\r\nSleep disabled indefinitely.\n"
    listen_commands  # Calls the function from listener.sh
    enable_sleep  # Calls the function from sleep_control.sh
}

# This function disables system sleep for a specified duration
disable_temporarily() {
    local duration_sec=$(set_duration "$1")  # Calls the function from sleep_duration.sh
    disable_sleep  # Calls the function from sleep_control.sh
    echo -e "\r\nSleep disabled for $1.\n"
    listen_commands  # Calls the function from listener.sh
    enable_sleep  # Calls the function from sleep_control.sh
}

# Check if an argument was passed
if [[ -z $1 ]]; then  # If no argument passed, call disable_indefinitely
    disable_indefinitely
else  # Else, call disable_temporarily with passed argument
    disable_temporarily "$1"
fi
