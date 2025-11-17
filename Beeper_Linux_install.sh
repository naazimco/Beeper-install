#!/bin/bash

echo "Downloading Beeper prerequisites, please enter your password to continue..."
if command -v apt > /dev/null 2>&1; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y nano libnss3 libnotify-bin libsecret-1-0 fuse3 wget curl
elif command -v dnf > /dev/null 2>&1; then
    sudo dnf check-update
    sudo dnf install -y nano nss libnotify libsecret fuse3 wget curl
elif command -v zypper > /dev/null 2>&1; then
    sudo zypper refresh
    sudo zypper update -y
    sudo zypper install -y nano nss libnotify libsecret fuse3
elif command -v pacman > /dev/null 2>&1; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm nano nss libnotify libsecret fuse
else
    echo "WARNING: Unsupported Linux distribution, can't install needed dependencies" >> /dev/stderr
fi

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
