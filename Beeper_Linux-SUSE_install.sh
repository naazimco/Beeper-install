#!/bin/bash

echo "Downloading Beeper prerequisites, please enter your password to continue..."
sudo zypper refresh
sudo zypper update -y
sudo zypper install -y nano nss libnotify libsecret fuse3
wget -O Beeper.AppImage https://download.beeper.com/linux/appImage/x64
wget -O beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O icon.png https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png
chmod a+x Beeper.AppImage
sudo mkdir -p /apps/AppImage/Beeper
sudo mv beeper.desktop ~/local/share/applications/
sudo mv Beeper.AppImage icon.png /apps/AppImage/Beeper/
cd /apps/AppImage/Beeper || exit
echo "Beeper installation completed successfully."
