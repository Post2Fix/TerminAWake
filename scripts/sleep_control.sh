#!/bin/bash

disable_sleep() {
    sudo pmset -b disablesleep 1
    sudo pmset -c disablesleep 1
}

enable_sleep() {
    sudo pmset -b disablesleep 0
    sudo pmset -c disablesleep 0
}
