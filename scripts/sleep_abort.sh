#!/bin/bash

# Function to abort sleep
# Takes duration in seconds as argument
abort_sleep() {
    local duration_sec=$1
    sleep "$duration_sec"  # Pauses the script for the specified duration
}
