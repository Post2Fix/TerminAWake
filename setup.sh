#!/bin/bash

# Variables
ZIP_FILE_NAME_START="TerminAWake"  # Start of the zip file name
ZIP_FILE_NAME_END=".zip"  # End of the zip file name
LINK_NAME="TerminAWake"  # Name of the symbolic link on the desktop

# Identify the appropriate zip file in the Downloads folder
ZIP_FILES=(~/Downloads/$ZIP_FILE_NAME_START*$ZIP_FILE_NAME_END)

if [ ${#ZIP_FILES[@]} -gt 1 ]; then
    echo "Multiple potential files found. Please select the correct one: "
    select TARGET_PATH in "${ZIP_FILES[@]}"; do
        if [ -n "$TARGET_PATH" ]; then
            break
        fi
    done
else
    TARGET_PATH="${ZIP_FILES[0]}"
fi

# Determine the directory of the located zip file
DIR_PATH=$(dirname "$TARGET_PATH")

# Determine the unzipped folder name by removing the ".zip" from the zip file name
FOLDER_NAME=$(basename "$TARGET_PATH" $ZIP_FILE_NAME_END)

# Determine the paths for unzipping and the script
UNZIP_PATH="$DIR_PATH/$FOLDER_NAME"
SCRIPT_PATH="$UNZIP_PATH/terminawake.sh"

# Unzip the located zip file
unzip "$TARGET_PATH" -d "$DIR_PATH"

# Make the scripts executable
chmod +x "$SCRIPT_PATH"
for script in "$UNZIP_PATH"/scripts/*.sh; do
    chmod +x "$script"
done
