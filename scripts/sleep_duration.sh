#!/bin/bash
source "$(dirname "$0")/sleep_control.sh"

# Disable sleep
disable_sleep

# Start a background job which re-enables sleep after the specified duration
sleep "$1" && enable_sleep &

sleep_pid=$!

# Function to turn display off
function display_off {
    echo "Turning display off..."
    osascript -e 'tell application "Finder" to sleep'
}

# Function to turn display on
function display_on {
    echo "Waking display up..."
    pmset displaysleepnow
}

# Function to lock screen
function lock_screen {
    echo "Locking screen..."
    "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend
}

# Configure terminal to not wait for Enter key
stty -icanon -echo min 1 time 0

echo "Sleep disabled for $1. Press Return to re-enable sleep, 'D' to turn display on/off, 'L' to lock screen."

while true
do
    read key
    case "$key" in
    "")
        # If Enter is pressed, re-enable sleep and break the loop
        echo "Re-enabling sleep..."
        kill "$sleep_pid"
        enable_sleep
        break
        ;;
    [dD])
        # If 'D' is pressed, toggle display on/off
        echo "Toggling display..."
        display_off
        sleep 1
        display_on
        ;;
    [lL])
        # If 'L' is pressed, lock screen
        echo "Locking screen..."
        lock_screen
        ;;
    esac
done

# Reset terminal configuration
stty sane
