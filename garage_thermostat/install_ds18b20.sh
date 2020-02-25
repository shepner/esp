mkdir -p components/ds18b20
git clone --recursive https://github.com/feelfreelinux/ds18b20.git components/ds18b20
mkdir -p components/ds18b20/include
ln -s components/ds18b20/ds18b20.h components/ds18b20/include/ds18b20.h
