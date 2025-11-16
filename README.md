# Beeper Install Scripts  

Easy-install scripts for Beeper on Windows, macOS, Linux, and ChromeOS.  

## Overview  

This repository provides command-line scripts to simplify the installation of Beeper on multiple operating systems. The scripts automate the setup process, making it easier for users to get started with Beeper.  

## Supported Platforms  

- **Windows** ([Beeper_Windows_install.ps1](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Windows_install.ps1))  
- **macOS (Apple Silicon)** ([Beeper_macOS-AppleSilicon_install.command](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_macOS-AppleSilicon_install.command))
- **macOS (Intel)** ([Beeper_macOS-Intel_install.command](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_macOS-Intel_install.command))  
- **Arch Linux** ([Beeper_ArchLinux_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Arch_install.sh))  
- **Debian/Ubuntu/KDE/Linux Mint** ([Linux_Debian+Ubuntu_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Debian+Ubuntu_install.sh))  
- **Fedora** ([Linux_Fedora_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Fedora_install.sh))  
- **openSUSE** ([Beeper_SUSE_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-SUSE_install.sh))  
- **ChromeOS** ([Beeper_ChromeOS_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_ChromeOS_install.sh))  

## Installation  

### Per-platform
Download the file for your platform (excluding Windows) by selecting an option above and saving (Ctrl+S on Linux/ChromeOS browsers, Cmd+S on macOS browsers).

#### Windows
0. Ensure you are connected to the Internet.
1. Press Windows+X and select Terminal [on Windows 11] or Windows PowerShell [on Windows 10].  
2. Run `irm https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Windows_install.ps1 | iex`

#### macOS (Apple Silicon & Intel)
1. Open a new Finder window and navigate to the location of the downloaded file (usually Downloads).
2. Double-click the file to start opening it.
3. Open System Settings (or System Preferences) and go to Privacy & Security.
4. Click 'Open Anyway' (you may have to scroll down) and follow the prompts to allow the script to run.

#### ChromeOS
1. At the bottom right of the screen, select the time.
2. Select Settings and then About ChromeOS and then Developers.
3. Next to "Linux development environment," select Set up.
4. Follow the on-screen instructions. Setup can take 10 minutes or more.
5. A terminal window will open. `cd ~/Downloads` (or wherever the downloaded file is located)
6. Then run `./Beeper_ChromeOS_install.sh`

#### Linux:
1. Open your Terminal app
2. Run `cd ~/Downloads` (or wherever the downloaded file is located)
3. Then run
```
chmod +x Linux-{your OS}_install.sh
./Beeper_Linux-{your OS}_install.sh
```

##### Note for Linux:
The update functionality might not work on linux, therefore you can use [Beeper_Linux_update.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux_update.sh) to perform those. This will keep one previous version of Beeper.AppImage in case the new version would introduce any issues. 

### Development

1. Install Git

2. Clone the repository:  
```
git clone https://github.com/naazimco/Beeper-install.git
cd Beeper-install
```

3. Run the appropriate script for your operating system.

- On Windows, `./Beeper_Windows_install.ps1`

- On macOS, `./Beeper_macOS_install.command`

- On Debian/Ubuntu/KDE/XFCE/Linux Mint/your Debian distro,
```
chmod +x Beeper_Linux-Debian+Ubuntu_install.sh
./Beeper_Linux-Debian+Ubuntu_install.sh
```

- On openSUSE,
```
chmod +x Beeper_Linux-SUSE_install.sh
./Beeper_Linux-SUSE_install.sh
```

- On Fedora Linux,
```
chmod +x Beeper_Linux-Fedora_install.sh
./Beeper_Linux-Fedora_install.sh
```
- On Arch Linux,
```
chmod +x Beeper_Linux-Arch_install.sh
./Beeper_Linux-Arch_install.sh
```
# Notes

Ensure you have the necessary dependencies installed before running the script.
Some scripts may require root privileges (sudo).
The repository is actively being improved, and additional features may be added.

# Contributing

If you'd like to contribute, feel free to submit a pull request or open an issue.
