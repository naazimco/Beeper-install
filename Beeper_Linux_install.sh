#!/bin/bash
set -euo pipefail

GREEN="$(tput setaf 2)"
CYAN="$(tput setaf 6)"
YELLOW="$(tput setaf 3)"
RED="$(tput setaf 1)"
RESET="$(tput sgr0)"

echo "${CYAN}Detecting Linux distribution...${RESET}"

install_deps() {
    if command -v apt >/dev/null; then
        echo "${CYAN}Installing prerequisites with APT...${RESET}"
        sudo apt update
        sudo apt install -y libnss3 libnotify-bin libsecret-1-0 fuse3 wget curl desktop-file-utils || true

    elif command -v dnf >/dev/null; then
        echo "${CYAN}Installing prerequisites with DNF...${RESET}"
        sudo dnf install -y nss libnotify libsecret fuse3 wget curl desktop-file-utils || true

    elif command -v zypper >/dev/null; then
        echo "${CYAN}Installing prerequisites with Zypper...${RESET}"
        sudo zypper install -y nss libnotify libsecret fuse3 wget curl desktop-file-utils || true

    elif command -v pacman >/dev/null; then
        echo "${CYAN}Installing prerequisites with Pacman...${RESET}"
        sudo pacman -Sy --noconfirm nss libnotify libsecret fuse wget curl desktop-file-utils || true

    else
        echo "${YELLOW}WARNING: Unsupported distribution. Attempting installation anyway...${RESET}"
    fi
}

install_deps

ARCH=$(uname -m)
case "$ARCH" in
    x86_64)
        BEEPER_URL="https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop"
        ;;
    aarch64|arm64)
        BEEPER_URL="https://api.beeper.com/desktop/download/linux/arm64/stable/com.automattic.beeper.desktop"
        ;;
    *)
        echo "${RED}Unsupported architecture: $ARCH${RESET}"
        exit 1
        ;;
esac

echo "${CYAN}Fetching Beeper download URL...${RESET}"
FINAL_URL=$(curl -Ls -o /dev/null -w '%{url_effective}' "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "${RED}Error: Failed to resolve Beeper download URL.${RESET}"
    exit 1
fi

echo "${GREEN}Resolved download URL:${RESET} $FINAL_URL"

WORKDIR=$(mktemp -d /tmp/beeper_install_XXXXXX)
APPDIR="$HOME/Applications/Beeper"
ICONDIR="$HOME/.local/share/icons/hicolor/128x128/apps"
mkdir -p "$APPDIR" "$ICONDIR"

echo "${CYAN}Downloading Beeper AppImage...${RESET}"
wget --progress=bar:force -O "$WORKDIR/Beeper.AppImage" "$FINAL_URL"

if [[ ! -s "$WORKDIR/Beeper.AppImage" ]]; then
    echo "${RED}Error: Beeper.AppImage download failed or is empty.${RESET}"
    exit 1
fi

echo "${CYAN}Downloading Beeper icon...${RESET}"
wget -q -O "$WORKDIR/beeper.png" \
  https://raw.githubusercontent.com/naazimco/Beeper-install/main/beeper.png

chmod +x "$WORKDIR/Beeper.AppImage"

echo "${CYAN}Installing Beeper...${RESET}"

mv "$WORKDIR/Beeper.AppImage" "$APPDIR/Beeper.AppImage"
mv "$WORKDIR/beeper.png" "$ICONDIR/beeper.png"
update-icon-cache ~/.local/share/icons/hicolor

echo "Generating Beeper desktop entry..."

DESKTOP_FILE="$HOME/.local/share/applications/beeper.desktop"
mkdir -p "$(dirname "$DESKTOP_FILE")"

cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Name=Beeper
GenericName=Chat Client
Comment=Unified messaging app for all your chats
Icon=beeper
Exec=$APPDIR/Beeper.AppImage %U
TryExec=$APPDIR/Beeper.AppImage
Terminal=false
Categories=Network;InstantMessaging;Chat;
StartupNotify=true
StartupWMClass=Beeper
MimeType=x-scheme-handler/beeper;
Keywords=Chat;Messaging;IM;Beeper;
X-GNOME-UsesNotifications=true
EOF

desktop-file-install "$DESKTOP_FILE" 2>/dev/null || true
update-desktop-database ~/.local/share/applications 2>/dev/null || true

chmod +x "$DESKTOP_FILE"
echo "Desktop entry installed: $DESKTOP_FILE"


echo "${GREEN}Beeper installation completed successfully!${RESET}"
echo "You can now launch Beeper from your application menu."
