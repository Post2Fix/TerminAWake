#!/bin/bash

# sleep_duration.sh
echo "The system will stay awake for $1."

# Set sleep duration
sudo pmset sleep 0 displaysleep 0 &>/dev/null
sudo pmset -a disablesleep 1 &>/dev/null

# Sleep timer
(sleep "$1" && "${SCRIPT_DIR}/sleep_control.sh" enable) &
