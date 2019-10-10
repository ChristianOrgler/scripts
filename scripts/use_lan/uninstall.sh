#!/bin/bash

Echo 'Unload ..'
sudo launchctl unload /Library/LaunchAgents/com.mine.toggleairport.plist

echo 'Removing all files ..'
rm /Library/Scripts/toggleAirport.sh
rm /Library/LaunchAgents/com.mine.toggleairport.plist