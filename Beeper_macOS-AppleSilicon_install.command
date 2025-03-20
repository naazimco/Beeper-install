#!/bin/bash

echo "Downloading Beeper for macOS..."
# Beeper API URL
BEEPER_URL="https://api.beeper.com/desktop/download/macos/arm64/stable/com.automattic.beeper.desktop"
# Get the actual download link (follow redirects)
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

echo "Final download URL: $FINAL_URL"
BEEPER_ZIP="$HOME/Downloads/Beeper.zip"
BEEPER_EXTRACT="$HOME/Downloads/Beeper_Extract"
curl -L "$FINAL_URL" -o "$BEEPER_ZIP"
mkdir -p "$BEEPER_EXTRACT"
unzip -q "$BEEPER_ZIP" -d "$BEEPER_EXTRACT"
BEEPER_APP=$(find "$BEEPER_EXTRACT" -maxdepth 2 -name "Beeper Desktop.app" -type d)

if [[ -d "$BEEPER_APP" ]]; then
    echo "Copying Beeper to /Applications..."
    cp -R "$BEEPER_APP" /Applications/
else
    echo "Error: Beeper Desktop.app not found in the extracted files."
    exit 1
fi

echo "Cleaning up..."
rm -rf "$BEEPER_ZIP" "$BEEPER_EXTRACT"
echo "Beeper installation completed successfully. You can run the app from Applications."
