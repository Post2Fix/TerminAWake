#!/bin/bash

# sleep_control.sh
if [ "$1" = "disable" ]; then
    echo "Disabling system sleep..."
    sudo pmset -a disablesleep 1 &>/dev/null
elif [ "$1" = "enable" ]; then
    echo "Enabling system sleep..."
    sudo pmset -a disablesleep 0 &>/dev/null
else
    echo "Unknown command."
fi
