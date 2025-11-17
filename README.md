# Beeper Install Scripts

![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Maintained-Yes-success)

Cross-platform install scripts for Beeper on Windows, macOS, Linux, and ChromeOS.  
These scripts automate setup so users can install Beeper quickly and consistently.



## Supported Platforms

| OS | Script | File |
|----|--------|------|
| <img src="https://img.icons8.com/fluency/48/windows-11.png" width="29"> | PowerShell installer | [`Beeper_Windows_install.ps1`](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Windows_install.ps1) |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg" width="29"> | .command installer | [`Beeper_macOS_install.command`](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_macOS_install.command) |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" width="29"> | Bash installer (Arch, Debian/Ubuntu, Fedora, openSUSE) | [`Beeper_Linux_install.sh`](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux_install.sh) |
| <img src="https://img.icons8.com/fluency/48/chrome.png" width="29"> | Bash installer | [`Beeper_chromeOS_install.sh`](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_chromeOS_install.sh) |

# Installing
### Windows
1. Press Windows+X
2. Select Terminal [on Windows 11] or Windows PowerShell [on Windows 10 and below].  
3. Run `irm https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Windows_install.ps1 | iex`

---

### macOS
1. Open the [macOS install script link](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_macOS_install.command).
2. Press Command+S to save it.
   - If Safari adds “.txt”, rename the file to: Beeper_macOS_install.command
3. Open your Downloads folder and double-click the file.
4. If macOS blocks it, go to System Settings (or System Preferences) → Privacy & Security → Open Anyway

---

### Linux
1. Download [Beeper_Linux_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux_install.sh) by opening the link and pressing Ctrl+S.
2. Open your terminal application, then run these commands:
```
cd ~/Downloads
chmod +x Beeper_Linux_install.sh
./Beeper_Linux_install.sh
```

---

### chromeOS
1. Save [Beeper_chromeOS_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_chromeOS_install.sh) by opening the link and pressing Ctrl+S.
2. In the bottom-right corner of the screen, select the time.
3. Select Settings → About ChromeOS → Developers.
4. Next to "Linux development environment," select Set up.
5. Follow the on-screen instructions. Setup can take 10 minutes or more.
6. A terminal window should open. If it does not, open the Terminal app from the app launcher.
7. Run these commands:
   ```
   cd ~/Downloads
   ./Beeper_ChromeOS_install.sh
   ```

---

# Development
Open up your terminal app and run these commands:
```
git clone https://github.com/naazimco/Beeper-install.git
cd Beeper-install
```
Run the installer script for your platform.

# Notes
- Ensure you have the necessary dependencies installed before running the script.
- Some scripts may require root privileges (sudo).
- The repository is actively being improved, and additional features may be added.


# Contributing
Pull requests and issues are welcome. If you'd like to contribute, feel free to submit a pull request or open an issue.
