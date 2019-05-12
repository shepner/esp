#!/bin/sh

# set the serial interface to "/dev/cu.SLAB_USBtoUART"
#make menuconfig

# in cases of build errors:
#rm -R ./build

# flash the latest
make flash

# show the serial output.  'Ctrl+]' to break out
#make monitor




