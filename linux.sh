echo Downloading Beeper prerequisites, please accept the SuDo request.
sudo apt upgrade -y
sudo apt install nano libnss3 libnotify4 libsecret-1-0 fuse -y
wget https://download.beeper.com/linux/appImage/x64 -O Beeper.AppImage
wget https://raw.githubusercontent.com/Naazim-Apps/Beeper-install/main/beeper.desktop
chmod a+x Beeper.AppImage
sudo mkdir /apps
sudo mkdir /apps/AppImage
sudo mkdir /apps/AppImage/Beeper
sudo cp beeper.desktop ~/.local/share/applications
sudo cp Beeper.AppImage /apps/AppImage/Beeper
sudo cp icon.png /apps/AppImage/Beeper
cd /apps/AppImage/Beeper/
echo Succesfully installed Beeper.
