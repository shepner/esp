#!/bin/sh
# WARNING!  This assumes it is being run from "~/src/esp"

WORKDIR=$HOME/src/esp
mkdir -p $WORKDIR



#setup toolchain
#https://docs.espressif.com/projects/esp-idf/en/stable/get-started/macos-setup.html

pip install pyserial  # it currently uses python2



# download and install the current stable ESP32 toolchain for macOS:
URL=https://dl.espressif.com/dl/xtensa-esp32-elf-osx-1.22.0-80-g6c4433a-5.2.0.tar.gz
wget -N -P $WORKDIR $URL
tar -xzf $WORKDIR/`basename $URL` -C $WORKDIR


# update .profile as appropriate:
cat >> $HOME/.profile <<'EOM'

# esp-idf
if [ -d $HOME/src/esp/xtensa-esp32-elf/bin ] ; then
  export PATH=$PATH:$HOME/src/esp/xtensa-esp32-elf/bin
  export IDF_PATH=$HOME/src/esp/esp-idf
fi

EOM



# (re)install the ESP32 specific API/libraries
# https://docs.espressif.com/projects/esp-idf/en/stable/get-started/index.html#get-started-get-esp-idf
VERSION="v3.1.2"

rm -Rf $WORKDIR/esp-idf

git clone -b $VERSION --recursive https://github.com/espressif/esp-idf.git esp-idf-$VERSION

ln -s $WORKDIR/esp-idf-$VERSION $WORKDIR/esp-idf


