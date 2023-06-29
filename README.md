# Advanced MacOS sleep control

Create an executable script file to disable MacOS sleep for a user specified duration.

Sleep is prevented on battery, while charging also when a MacBook lid is closed.

# Setting up the script for easy usage

- Download 'awake' or copy and save it using a text editor (without '.sh' file extention)

- Run ```chmod +x [path to 'awake' file]``` to make it executable

# Running the script

Browse to the 'awake' file and run it using ```./awake``` to keep prevent sleep indefinitely, or specify a duration, for example:

- ```./awake 30``` - stay awake for 30 minutes (no suffix defaults to minutes)

- ```./awake 90s``` - stay awake for a minute and a half

- ```./awake 24h``` - stay awake for 24 hours

# Future goals
- Issues
  - Fix sleep not reenabled (Runnning the script for 1 second (```./ awake 1s```) will always reenable sleep).
    - If script is terminated mid run
- Features
  - Allow for hours, minutes and seconds to be combined (e.g. ```./awake 1h 30m 25s```)
  - Convert to MacOS app
    - Share downloadable executable file instead of script that needs to be setup and executed in terminal
    - Create a basic MacOS UI based app
