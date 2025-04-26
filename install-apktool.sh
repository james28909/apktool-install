#!/data/data/com.termux/files/usr/bin/bash

yes | pkg i openjdk-17
mkdir -p ./apktool_tmp

printf "Downloading Apktool...\n"
curl -s "https://api.github.com/repos/iBotPeaches/Apktool/releases/latest" | grep -o '"browser_download_url": "[^"]*\.jar"' | sed 's/"browser_download_url": "\(.*\.jar\)"/\1/' | xargs -I {} curl -L -o ./apktool_tmp/apktool.jar {}
printf "Downloading Apktool wrapper script...\n"
curl -Lo ./apktool_tmp/apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool

chmod +x ./apktool_tmp/apktool*

cp ./apktool_tmp/apktool ./apktool_tmp/apktool.jar $PREFIX/bin

printf "Apktool installation completed!\n"
apktool --version
rm -rf apktool_tmp
