#!/bin/bash

# Function to sleep the display
# pmset displaysleepnow forces the display to immediately enter sleep mode
sleep_display() {
    #echo "Turnning off the display..."
    sudo pmset displaysleepnow
}
