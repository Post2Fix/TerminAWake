#!/bin/bash

# Go to the directory where the script is running
cd "$(dirname "$0")"

# Make all scripts executable
chmod +x terminawake.sh
chmod +x scripts/sleep_abort.sh
chmod +x scripts/sleep_control.sh
chmod +x scripts/sleep_duration.sh
chmod +x scripts/listener.sh

# Create a symbolic link on Desktop
ln -s "$(pwd)/terminawake.sh" ~/Desktop/TerminAwake
