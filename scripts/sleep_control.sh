#!/bin/bash

# Define a function to disable system sleep
disable_sleep() {
    sudo pmset -a disablesleep 1
}

# Define a function to enable system sleep
enable_sleep() {
    sudo pmset -a disablesleep 0
}

# Define a function to toggle system sleep
toggle_sleep() {
    local status=$(pmset -g | grep SleepDisabled)
    if [[ "$status" == *"1"* ]]; then
        enable_sleep
        echo -e "\r\nSleep enabled."
    else
        disable_sleep
        echo -e "\r\nSleep disabled."
    fi
}
