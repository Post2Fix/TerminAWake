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

# Define a function to set sleep timers
set_timers() {
    echo -e "\nEnter system sleep delay (in format 'NhMmSs', e.g. '1h30m' or '45s'): "
    read -r system_sleep_time
    echo -e "Enter display sleep delay (in format 'NhMmSs', e.g. '1h30m' or '45s'): "
    read -r display_sleep_time

    system_sleep_delay=$(echo "$system_sleep_time" | awk -F'[hms]' '{ print ($1*3600)+($2*60)+$3 }')
    display_sleep_delay=$(echo "$display_sleep_time" | awk -F'[hms]' '{ print ($1*3600)+($2*60)+$3 }')

    # Now use pmset to set the sleep and display sleep delays, replacing any existing ones
    sudo pmset -a sleep $system_sleep_delay
    sudo pmset -a displaysleep $display_sleep_delay
    echo -e "\nSleep timers set: system sleep delay of $system_sleep_time and display sleep delay of $display_sleep_time."
}
