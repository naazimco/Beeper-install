#!/bin/bash

echo "Downloading Beeper prerequisites, please enter your password to continue..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm nano nss libnotify libsecret fuse3
wget -O Beeper.AppImage https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop
wget -O beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O icon.png https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png
chmod a+x Beeper.AppImage
sudo mkdir -p /apps/AppImage/Beeper
sudo mv beeper.desktop ~/.local/share/applications/
sudo mv Beeper.AppImage icon.png /apps/AppImage/Beeper/
cd /apps/AppImage/Beeper || exit
echo "Beeper installation completed successfully."
