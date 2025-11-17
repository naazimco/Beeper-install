#!/bin/bash

APP_DIR="/apps/AppImage/Beeper"

echo "Fetching the newest Beeper version..."
BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

if [[ ! -d "$APP_DIR" ]]; then
    echo "Error: Beeper install directory not found: $APP_DIR"
    exit 1
fi

echo "Downloading Beeper from $FINAL_URL..."
wget -O Beeper.AppImage "$FINAL_URL"

chmod +x Beeper.AppImage

if [ -f "$APP_DIR/Beeper.AppImage.old" ]; then
    echo "Removing previous Beeper.AppImage backup..."
    sudo rm "$APP_DIR/Beeper.AppImage.old"
fi

echo "Saving currently installed Beeper.AppImage as backup in $APP_DIR/Beeper.AppImage.old"
if [ -f "$APP_DIR/Beeper.AppImage" ]; then
    sudo mv "$APP_DIR/Beeper.AppImage" "$APP_DIR/Beeper.AppImage.old"
fi

echo "Replacing Beeper version..."
sudo mv Beeper.AppImage "$APP_DIR/"

cd "$APP_DIR" || exit

echo "Beeper update completed successfully."
