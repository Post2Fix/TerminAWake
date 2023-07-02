#!/bin/bash

# Include the display control script
source "$(dirname "$0")/display_control.sh"

# listener.sh

listen_commands() {
    stty -icanon -echo min 1 time 0

    while true; do
        read -r key
        case "$key" in
            d)
                # Sleep the display
                sleep_display
                ;;
            l)
                # pmset does not have an equivalent for locking the screen
                ;;
            r)
                # Enabling sleep
                enable_sleep
                ;;
            q)
                echo "Quitting..."
                break
                ;;
            *)
                echo "Unknown command."
                ;;
        esac
    done

    # reset terminal settings
    stty sane
}
