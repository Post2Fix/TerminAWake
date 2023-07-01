# Advanced MacOS sleep control

Setup this script to disable MacOS sleep for any specified duration.

Sleep is prevented on battery & while charging, including when a MacBook lid is closed.

# Credits

Reddit user [bmw3393](https://www.reddit.com/user/bmw3393/) schooled me on apps that fail because of bad names and [suggested 'TerminaWake'](https://www.reddit.com/r/mac/comments/14mm3db/comment/jq2n4ew/?context=3) which is such a perfect name 😎 (Also nice logo as TerminAWake)

# Setting up

We made it super easy for anyone to setup this Terminal app. If you never used Terminal, give it a try.

## Download the files

- Click the green 'Code' button (top right) and select 'Download Zip'
- Ensure the download was saved into your Downloads folder

## Set it all up with a single paste

- Open a terminal window (you can press F4 or command+space & search 'Terminal')
- Paste this command into the terminal and run it

```bash
unzip ~/Downloads/TerminAWake*.zip -d ~/ && chmod +x ~/TerminAWake*/setup.sh && ~/TerminAWake*/setup.sh
```

# Run it

- Open the shortcut

# Using the script

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
