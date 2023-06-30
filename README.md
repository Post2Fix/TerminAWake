# Advanced MacOS sleep control

Setup this script to disable MacOS sleep for any specified duration.

Sleep is prevented on battery & while charging, including when a MacBook lid is closed.

# Setting up the script is easy

1. Download 'stay-awake' or copy its content into a text editor & save the file as 'stay-awake' (without a file extension)
2. Run ```chmod +x [full path to the 'awake' file]``` to make the file executable. To get the file path:
  i. Drag the 'stay-awake' file into the terminal window, then delete the [comment]
  ii. Secondary click on the file and press the option key to reveal the "copy 'stay-awake' as Pathname" option

# Running the script

Browse to the 'stay-awake' file and run it using the following examples:

- ```./awake```             - stay awake indefinitely 

- ```./awake 30m```         - stay awake for 30 minutes

- ```./awake 90s```         - stay awake for a minute and a half

- ```./awake 24h```         - stay awake for 24 hours

- ```./awake 1h 15m 30s```  - stay awake for an hour, 15 minutes & 30 seconds in total

- ```./awake 1m 10s ```     - stay awake for 70 seconds


# Future goals
- Issues
  
- Features
  - Convert to MacOS app
    - Share downloadable executable file instead of script that needs to be setup and executed in terminal
    - Create a basic MacOS UI based app
