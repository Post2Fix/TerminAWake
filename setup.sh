#!/bin/bash

# Constants
SCRIPT_NAME="terminawake.sh"  # Name of the main script
LINK_NAME="TerminAWake"  # Name of the symbolic link on the desktop

# Search for zip files starting with 'TerminAWake' in the Downloads directory
ZIP_FILES=$(find $HOME/Downloads -name 'TerminAWake*.zip')

# Convert the string to an array
ZIP_FILES=($ZIP_FILES)

# If no such file is found
if [ ${#ZIP_FILES[@]} -eq 0 ]; then
  echo "Could not locate a zip file starting with 'TerminAWake' in your Downloads folder."
  exit 1
fi

# If more than one such file is found, ask the user to select one
if [ ${#ZIP_FILES[@]} -gt 1 ]; then
  echo "Multiple 'TerminAWake*.zip' files found. Please select one:"
  select TARGET_PATH in "${ZIP_FILES[@]}"; do
    if [[ -n $TARGET_PATH ]]; then
      break
    fi
  done
else
  TARGET_PATH=${ZIP_FILES[0]}
fi

# Extract the zip file and folder names from the path
ZIP_FILE_NAME=$(basename "$TARGET_PATH")
FOLDER_NAME=${ZIP_FILE_NAME%.zip}

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
