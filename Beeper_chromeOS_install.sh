#!/bin/bash

echo "As a reminder, Beeper for chromeOS is available in the Google Play Store and may have better stability/compatibility."
echo "Downloading Beeper prerequisites, please enter your password to continue..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y nano libnss3 libnotify-bin libsecret-1-0 fuse3 wget curl desktop-file-utils
BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

echo "Downloading Beeper from $FINAL_URL..."
wget -O Beeper.AppImage "$FINAL_URL"
chmod a+x Beeper.AppImage
mkdir -p ~/Applications/Beeper
mv Beeper.AppImage ~/Applications/Beeper/
mkdir -p ~/.local/share/applications
wget -O ~/.local/share/applications/beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O ~/Applications/Beeper/icon.png https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png
chmod +x ~/.local/share/applications/beeper.desktop
desktop-file-install ~/.local/share/applications/beeper.desktop

echo "Beeper installation completed successfully."
echo "You may need to restart your chromeOS session for the app icon to appear."
