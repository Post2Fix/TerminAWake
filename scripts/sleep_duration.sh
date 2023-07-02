#!/bin/bash

set_duration() {
    local duration=$1
    # Separate the time & timescale suffixes
    local suffix="${duration: -1}"
    local value="${duration%?}"

    # Identify user input's timescale and convert it to seconds
    case "$suffix" in
    s) duration_sec="$value" ;;
    h) duration_sec=$((value * 3600)) ;;
    *) duration_sec="$((duration * 60))" ;;  # Assume minutes suffix other than 'h' & 's' (including no value)
    esac

    echo $duration_sec
}
