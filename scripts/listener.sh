#!/bin/bash

# listener.sh
stty -icanon -echo min 1 time 0

echo "Press 'd' to toggle display, 'l' to lock screen, 'r' to enable sleep, or 'q' to quit."

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
            "${SCRIPT_DIR}/sleep_control.sh" enable
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
