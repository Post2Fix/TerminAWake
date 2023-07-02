#!/bin/bash

source "$SCRIPTS_DIR/sleep_control.sh"

abort_sleep() {
    local duration_sec=$1
    sleep "$duration_sec" & wait $!
}
