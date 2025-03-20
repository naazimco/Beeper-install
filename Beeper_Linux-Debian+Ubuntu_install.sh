#!/bin/bash

echo "Downloading Beeper prerequisites, please enter your password to continue..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y nano libnss3 libnotify-bin libsecret-1-0 fuse3 wget curl
BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

echo "Downloading Beeper from $FINAL_URL..."
wget -O Beeper.AppImage "$FINAL_URL"
wget -O beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O icon.png https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png
chmod a+x Beeper.AppImage
sudo mkdir -p /apps/AppImage/Beeper
sudo mv beeper.desktop ~/.local/share/applications/
sudo mv Beeper.AppImage icon.png /apps/AppImage/Beeper/
cd /apps/AppImage/Beeper || exit
echo "Beeper installation completed successfully."
