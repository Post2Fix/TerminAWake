#!/bin/bash

# Save current terminal settings
saved_stty=$(stty -g)

# Set terminal to raw mode to detect individual keypresses
stty raw -echo

echo "Press 'a' for action A, 'b' for action B, or 'q' to quit."

# Reset terminal settings when script exits
trap "stty $saved_stty" EXIT

# Read input
while read -n 1 key; do
    case $key in
        a)
            printf "You selected action A.\n"
            ;;
        b)
            printf "You selected action B.\n"
            ;;
        q)
            printf "Quitting...\n"
            break
            ;;
        *)
            printf "Invalid option: $key\n"
            ;;
    esac
done
