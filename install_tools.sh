#!/bin/sh
# WARNING!  This assumes it is being run from "~/Code/esp"



#setup toolchain
#https://docs.espressif.com/projects/esp-idf/en/stable/get-started/macos-setup.html

# This currently uses python2
#sudo easy_install pip
sudo pip install pyserial


# download and install the current stable ESP32 toolchain for macOS:
URL=https://dl.espressif.com/dl/xtensa-esp32-elf-osx-1.22.0-80-g6c4433a-5.2.0.tar.g
wget $URL
tar -xzf `basename $URL`


# update .profile as appropriate:
cat >> ~/.profile <<'EOM'

# esp-idf
if [ -d $HOME/Code/esp/xtensa-esp32-elf/bin ] ; then
  export PATH=$PATH:$HOME/Code/esp/xtensa-esp32-elf/bin
  export IDF_PATH=~/Code/esp/esp-idf
fi

EOM



# https://docs.espressif.com/projects/esp-idf/en/stable/get-started/index.html#get-started-get-esp-idf
# (re)install the ESP32 specific API/libraries
rm -Rf esp-idf
git clone -b v3.1.1 --recursive https://github.com/espressif/esp-idf.git


