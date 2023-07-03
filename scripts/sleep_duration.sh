#!/bin/bash

# Function to set sleep duration
# Takes duration as argument
set_duration() {
    local duration=$1
    local suffix="${duration: -1}"  # Get the last character
    local value="${duration%?}"  # Get all characters except the last

    case "$suffix" in
    s) duration_sec="$value" ;;  # If suffix is 's', interpret as seconds
    h) duration_sec=$((value * 3600)) ;;  # If suffix is 'h', interpret as hours and convert to seconds
    *) duration_sec="$((duration * 60))" ;;  # Else, interpret as minutes and convert to seconds
    esac

    echo $duration_sec  # Print the duration in seconds
}
