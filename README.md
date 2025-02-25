# Beeper Install Scripts  

Easy-install scripts for Beeper on Windows, macOS, Linux, and ChromeOS.  

## Overview  

This repository provides command-line scripts to simplify the installation of Beeper on multiple operating systems. The scripts automate the setup process, making it easier for users to get started with Beeper.  

## Supported Platforms  

- **Windows** ([Beeper_Windows_install.ps1](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Windows_install.ps1))  
- **macOS** ([Beeper_macOS_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_macOS_install.sh))  
- **Arch Linux** ([Beeper_ArchLinux_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Arch_install.sh))  
- **Debian/Ubuntu/KDE/Linux Mint** ([Linux_Debian+Ubuntu_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Debian+Ubuntu_install.sh))  
- **Fedora** ([Linux_Fedora_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-Fedora_install.sh))  
- **openSUSE** ([Beeper_SUSE_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_Linux-SUSE_install.sh))  
- **ChromeOS** ([Beeper_ChromeOS_install.sh](https://github.com/naazimco/Beeper-install/raw/refs/heads/main/Beeper_ChromeOS_install.sh))  

## Installation  

### Per-platform
Download the file for your platform by selecting an option above.

#### Windows
Press Windows+X and select Terminal [on Windows 11] or Windows PowerShell [on Windows 10].  
Run `cd ~/Downloads` (or wherever the downloaded file is located)
Then run `./Beeper_Windows_install.sh`

#### macOS
Open Terminal using Spotlight (command+space) or Launchpad.
Run `cd ~/Downloads` (or wherever the downloaded file is located)
Then run `./Beeper_macOS_install.sh`

#### ChromeOS
At the bottom right of the screen, select the time.
Select Settings and then About ChromeOS and then Developers.
Next to "Linux development environment," select Set up.
Follow the on-screen instructions. Setup can take 10 minutes or more.
A terminal window will open. `cd ~/Downloads` (or wherever the downloaded file is located)
Then run `./Beeper_ChromeOS_install.sh`

#### Linux:
Open your Terminal app
Run `cd ~/Downloads` (or wherever the downloaded file is located)
Then run
```
chmod +x Linux-{your OS}_install.sh
./Beeper_Linux-{your OS}_install.sh
```

### Development

1. Install Git

2. Clone the repository:  
```
git clone https://github.com/naazimco/Beeper-install.git
cd Beeper-install
```

3. Run the appropriate script for your operating system.

- On Windows, `./Beeper_Windows_install.sh`

- On macOS, `./Beeper_macOS_install.sh`

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
