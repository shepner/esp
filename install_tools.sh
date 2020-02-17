#!/bin/sh
# WARNING!  This assumes it is being run from "~/src/esp"

WORKDIR=$HOME/src/esp
mkdir -p $WORKDIR

#install the XCode command line tools
xcode-select --install

#setup toolchain
#https://docs.espressif.com/projects/esp-idf/en/stable/get-started/macos-setup.html


#install CMake & Ninja build
#brew install cmake ninja ccache
brew upgrade cmake ninja ccache




# (re)install the ESP32 specific API/libraries
# https://docs.espressif.com/projects/esp-idf/en/stable/get-started/index.html#get-started-get-esp-idf
VERSION="v4.0"

rm -Rf $WORKDIR/esp-idf

git clone -b $VERSION --recursive https://github.com/espressif/esp-idf.git  $WORKDIR/esp-idf-$VERSION

ln -s $WORKDIR/esp-idf-$VERSION $WORKDIR/esp-idf




# (re)install the ESP32 specific API/libraries
$WORKDIR/esp-idf/install.sh




# install the needed (python2) libs
pip install --user -r /Users/shepner/src/esp/esp-idf/requirements.txt




# update .profile as appropriate:
cat >> $HOME/.profile <<'EOM'

# esp-idf
if [ -d $HOME/src/esp/esp-idf ] ; then
  . $HOME/src/esp/esp-idf/export.sh
fi

EOM

