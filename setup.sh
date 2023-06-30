#!/bin/bash

# Variables
ZIP_FILE_NAME="TerminAWake-modularity.zip"  # Name of the zip file
FOLDER_NAME="TerminAWake-modularity"  # Name of the unzipped folder
SCRIPT_NAME="terminawake.sh"  # Name of the main script
LINK_NAME="TerminAWake"  # Name of the symbolic link on the desktop

# Check the Downloads directory first
if [[ -f "$HOME/Downloads/$ZIP_FILE_NAME" ]]; then
  TARGET_PATH="$HOME/Downloads/$ZIP_FILE_NAME"
else
  # If not found in Downloads, search the home directory excluding hidden directories
  TARGET_PATH=$(find $HOME -name '.*' -prune -o -name $ZIP_FILE_NAME -print)
fi

if [[ -z $TARGET_PATH ]]; then
  echo "Could not locate $ZIP_FILE_NAME in your home directory or Downloads folder."
  exit 1
fi

# Determine the directory of the located zip file
DIR_PATH=$(dirname "$TARGET_PATH")

# Determine the paths for unzipping and the script
UNZIP_PATH="$DIR_PATH/$FOLDER_NAME"
SCRIPT_PATH="$UNZIP_PATH/$SCRIPT_NAME"

# Unzip the located zip file
unzip "$TARGET_PATH" -d "$DIR_PATH"

# Make the scripts executable
chmod +x "$SCRIPT_PATH" "$UNZIP_PATH/scripts/*.sh"

echo "Where would you like to place the application?"
echo "1) Home directory"
echo "2) Downloads folder"
echo "3) Applications folder (will require your password)"
read -p "Enter the number of your choice: " choice

case "$choice" in
  1)
    LINK_PATH="$HOME/$LINK_NAME"
    ;;
  2)
    LINK_PATH="$HOME/Downloads/$LINK_NAME"
    ;;
  3)
    sudo mv "$UNZIP_PATH" "/Applications/"
    SCRIPT_PATH="/Applications/$FOLDER_NAME/$SCRIPT_NAME"
    LINK_PATH="/Applications/$LINK_NAME"
    ;;
  *)
    echo "Invalid option. The application will be left in its current location."
    LINK_PATH="$DIR_PATH/$LINK_NAME"
    ;;
esac

# Create a symbolic link at the chosen location
ln -s "$SCRIPT_PATH" "$LINK_PATH"

echo "Setup completed successfully. You can now run the script from the link at the chosen location."
