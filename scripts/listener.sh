#!/bin/bash

# listener.sh

listen_commands() {
    stty -icanon -echo min 1 time 0

    while true; do
        read -r key
        case "$key" in
            d)
                osascript -e 'tell application "System Events" to key code 107' # This will toggle display
                ;;
            l)
                "/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend # This will lock screen
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
