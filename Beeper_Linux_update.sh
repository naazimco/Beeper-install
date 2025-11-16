#!/bin/bash

echo "Fetching the newest Beeper version..."
BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

echo "Downloading Beeper from $FINAL_URL..."
wget -O Beeper.AppImage "$FINAL_URL"

chmod a+x Beeper.AppImage

if [ -f "/apps/AppImage/Beeper/Beeper.AppImage.old" ]; then
    echo "Removing previous Beeper.AppImage backup..." 
    sudo rm /apps/AppImage/Beeper/Beeper.AppImage.old
fi

echo "Saving currently installed Beeper.AppImage as a backup in /apps/AppImage/Beeper/Beeper.AppImage.old"
sudo mv /apps/AppImage/Beeper/Beeper.AppImage /apps/AppImage/Beeper/Beeper.AppImage.old

echo "Replacing Beeper version..."
sudo mv Beeper.AppImage /apps/AppImage/Beeper/
cd /apps/AppImage/Beeper || exit
echo "Beeper update completed successfully."
