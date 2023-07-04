# Advanced MacOS sleep control

Advanced MacOS sleep manager.

## Features

- Disable sleep indfinitely at launch if no delay timer is specified
- Prevent sleep on battery & while charging, including when a MacBook lid is closed.
- Press 'return' to enable sleep (on-screen instruction)
- State hours, minutes and seconds for the sleep delay timer at launch (e.g. ./terminawake 1h 30m 15s)
- Displays total sleep delay in seconds after launch
- Unique, and very simple deployment (single Terminal command (without password) to setup from the downloaded repo)

## Easy setup

1. [Download this repository](https://github.com/Post2Fix/TerminAWake.git) to your Downloads folder
2. Paste & run this command in your Terminal (use the copy icon)
```bash
unzip ~/Downloads/TerminAWake*.zip -d ~/ && chmod +x ~/TerminAWake*/setup.sh && ~/TerminAWake*/setup.sh && sudo ~/TerminAWake*/terminawake.sh
```
  - To start a Terminal (Press F4 or [command + space] & search 'Terminal')

## Launching the app

A shortcut was created where you chose to deploy the app.

## Future goals
- Issues
  
- Features
  - Convert to MacOS app
    - Share downloadable executable file instead of script that needs to be setup and executed in terminal
    - Create a basic MacOS UI based app
