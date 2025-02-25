#!/bin/bash

echo "Downloading Beeper for macOS..."
BEEPER_URL="https://download.beeper.com/macos/Beeper.dmg"
BEEPER_DMG="$HOME/Downloads/Beeper.dmg"
BEEPER_MOUNT="/Volumes/Beeper"
curl -L "$BEEPER_URL" -o "$BEEPER_DMG"
echo "Mounting the Beeper disk image..."
hdiutil attach "$BEEPER_DMG" -mountpoint "$BEEPER_MOUNT"
echo "Copying Beeper to /Applications..."
cp -R "$BEEPER_MOUNT/Beeper.app" /Applications/
echo "Ejecting the Beeper disk image..."
hdiutil detach "$BEEPER_MOUNT"
echo "Cleaning up..."
rm "$BEEPER_DMG"
echo "Beeper installation completed successfully. You can run the app from Applications."
