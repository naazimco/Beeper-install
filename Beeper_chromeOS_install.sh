#!/bin/bash

echo "Reminder: Beeper for chromeOS is available in the Play Store and may offer better stability."

if [[ ! -d "/usr/bin" ]]; then
    echo "This script must be run inside the ChromeOS Linux (Crostini) environment."
    exit 1
fi

echo "Installing prerequisites..."
sudo apt update
sudo apt install -y nano libnss3 libnotify-bin libsecret-1-0 fuse3 wget curl desktop-file-utils xdg-utils

if ! command -v fusermount3 >/dev/null 2>&1; then
    echo "Warning: FUSE3 is not working. AppImage may run in extract mode only."
fi

BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
FINAL_URL=$(curl -Ls -o /dev/null -w %{url_effective} "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "Error: Failed to retrieve the final Beeper download URL."
    exit 1
fi

echo "Downloading Beeper from $FINAL_URL..."
INSTALL_DIR="$HOME/Applications/Beeper"
mkdir -p "$INSTALL_DIR"
wget -O "$INSTALL_DIR/Beeper.AppImage" "$FINAL_URL"
chmod +x "$INSTALL_DIR/Beeper.AppImage"

mkdir -p ~/.local/share/applications
wget -O ~/.local/share/applications/beeper.desktop https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.desktop
wget -O "$INSTALL_DIR/icon.png" https://raw.githubusercontent.com/naazimco/Beeper-install/main/icon.png

sed -i "s|Exec=.*|Exec=$INSTALL_DIR/Beeper.AppImage|" ~/.local/share/applications/beeper.desktop
sed -i "s|Icon=.*|Icon=$INSTALL_DIR/icon.png|" ~/.local/share/applications/beeper.desktop

desktop-file-install ~/.local/share/applications/beeper.desktop
update-desktop-database ~/.local/share/applications

echo "Beeper installation completed."
echo "If the icon does not appear, restart your ChromeOS session."
