#!/bin/bash

echo "Downloading Beeper prerequisites, please enter your password to continue..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y nano libnss3 libnotify4 libsecret-1-0 fuse3
wget -O Beeper.AppImage https://download.beeper.com/linux/appImage/x64
wget -O beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O icon.png https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png
chmod a+x Beeper.AppImage
sudo mkdir -p /apps/AppImage/Beeper
sudo mv beeper.desktop ~/.local/share/applications/
sudo mv Beeper.AppImage icon.png /apps/AppImage/Beeper/
cd /apps/AppImage/Beeper || exit
echo "Beeper installation completed successfully."
