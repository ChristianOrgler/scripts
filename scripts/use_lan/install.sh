#!/bin/bash

echo 'Copy toggle script to /Library/Scripts/'
cp toggleAirport.sh /Library/Scripts/toggleAirport.sh

echo 'Enable 755 rights to file.'
chmod 755 /Library/Scripts/toggleAirport.sh

echo 'Copy launch agent to /Library/LaunchAgents/'
cp com.mine.toggleairport.plist /Library/LaunchAgents/com.mine.toggleairport.plist

echo 'chown root & chmod 755'
chown root /Library/LaunchAgents/com.mine.toggleairport.plist
sudo chmod 755 /Library/LaunchAgents/com.mine.toggleairport.plist

echo 'Launching ..'
sudo launchctl load /Library/LaunchAgents/com.mine.toggleairport.plist