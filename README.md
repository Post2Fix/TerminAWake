# Advanced MacOS sleep control

Setup this script to disable MacOS sleep for any specified duration.

Sleep is prevented on battery & while charging, including when a MacBook lid is closed.

## Features

- Launch to disable sleep
- Press the return key to reenable sleep anytime (in app instruction)
- Multi parameter dleep delay timer input at launch (e.g. 1h 30m 15s)
- Displays total sleep delay in seconds after launch
- Very simplifies deployment (download and run a single Terminal command (without a password))

## Setup the app

We made it super easy for anyone to setup, even if you never used a terrminal.

### Save the app to your Downloads folder

- Click the green 'Code' button (top right) and select ['Download Zip', or use this link](https://github.com/Post2Fix/TerminAWake/archive/refs/heads/modularity-revert.zip). (Save it to the Downloads folder!)

### Setup by pasting a single command

- Open a terminal window (you can press F4 or command+space & search 'Terminal')
- Click the copy icon and paste into your Terminal (Press 'return' to run it)
```bash
unzip ~/Downloads/TerminAWake*.zip -d ~/ && chmod +x ~/TerminAWake*/setup.sh && ~/TerminAWake*/setup.sh
```

### Launch the app

A shortcut was created where you chose to deploy the app.

## Future goals
- Issues
  
- Features
  - Convert to MacOS app
    - Share downloadable executable file instead of script that needs to be setup and executed in terminal
    - Create a basic MacOS UI based app
