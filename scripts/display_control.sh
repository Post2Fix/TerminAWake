#!/bin/bash

# display_control.sh

# Function to sleep the display
sleep_display() {
    echo "Turnning off the display.."
    sudo pmset displaysleepnow
}
