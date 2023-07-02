# Function to disable sleep
disable_sleep() {
    echo "Disabling system sleep..."
    sudo pmset -a disablesleep 1 &>/dev/null
}

# Function to enable sleep
enable_sleep() {
    echo "Enabling system sleep..."
    sudo pmset -a disablesleep 0 &>/dev/null
}
