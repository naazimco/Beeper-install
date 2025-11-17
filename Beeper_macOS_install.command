#!/bin/bash

set -euo pipefail

# Colors
GREEN="$(tput setaf 2)"
CYAN="$(tput setaf 6)"
YELLOW="$(tput setaf 3)"
RED="$(tput setaf 1)"
RESET="$(tput sgr0)"

echo "${CYAN}Detecting system architecture...${RESET}"

ARCHITECTURE=$(uname -m)
case "$ARCHITECTURE" in
    arm64)
        BEEPER_URL="https://api.beeper.com/desktop/download/macos/arm64/stable/com.automattic.beeper.desktop"
        ;;
    x86_64)
        BEEPER_URL="https://api.beeper.com/desktop/download/macos/x64/stable/com.automattic.beeper.desktop"
        ;;
    *)
        echo "${RED}ERROR: Unsupported architecture: $ARCHITECTURE${RESET}" >&2
        exit 1
        ;;
esac

echo "${CYAN}Fetching Beeper download URL...${RESET}"
FINAL_URL=$(curl -Ls -o /dev/null -w '%{url_effective}' "$BEEPER_URL")

if [[ -z "$FINAL_URL" ]]; then
    echo "${RED}Error: Failed to retrieve the final Beeper download URL.${RESET}"
    exit 1
fi

echo "${GREEN}Resolved download URL:${RESET} $FINAL_URL"

# temp working directory
WORKDIR=$(mktemp -d /tmp/beeper_install_XXXXXX)
ZIP_PATH="$WORKDIR/Beeper.zip"

echo "${CYAN}Downloading Beeper...${RESET}"
curl -L --progress-bar "$FINAL_URL" -o "$ZIP_PATH"

# Validate ZIP file
if [[ ! -s "$ZIP_PATH" ]]; then
    echo "${RED}Error: Downloaded Beeper.zip is empty or missing.${RESET}"
    exit 1
fi

echo "${CYAN}Extracting Beeper...${RESET}"
unzip -q "$ZIP_PATH" -d "$WORKDIR"

# Locate .app
BEEPER_APP=$(find "$WORKDIR" -maxdepth 3 -type d -name "Beeper Desktop.app" | head -n 1)

if [[ -z "$BEEPER_APP" ]]; then
    echo "${RED}Error: Beeper Desktop.app not found inside the ZIP.${RESET}"
    exit 1
fi

INSTALL_PATH="/Applications/Beeper Desktop.app"

# Check if already installed
if [[ -d "$INSTALL_PATH" ]]; then
    echo "${YELLOW}Beeper already exists in /Applications.${RESET}"
    read -p "Overwrite existing installation? (y/N): " CONFIRM
    if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi
    rm -rf "$INSTALL_PATH"
fi

echo "${CYAN}Installing Beeper to /Applications...${RESET}"
ditto "$BEEPER_APP" "$INSTALL_PATH"

echo "${CYAN}Cleaning up temporary files...${RESET}"
rm -rf "$WORKDIR"

echo "${GREEN}Beeper installation completed successfully!${RESET}"
echo "You can now open Beeper from your Applications folder."
