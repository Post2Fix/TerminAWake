#!/bin/bash

source "$(dirname "$0")/sleep_control.sh"

abort_sleep() {
    local duration_sec=$1
    sleep "$duration_sec" & wait $!
}
