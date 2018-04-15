#!/bin/bash

# go to root
cd

# server update & requesting apps install
sudo apt update

# adding gcc repository
sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev

# reupdate source
apt-get -y  update;

# atcivate hugepages
echo 10000 > /proc/sys/vm/nr_hugepages

# creating swap files
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile > none    swap    sw    0   0 /etc/fstab
echo vm.swappiness=10 > /etc/sysctl.conf
sysctl -p

# installing gcc
apt-get -y  install gcc-7 g++-7;

# cloning xmrig package
git clone https://github.com/xmrig/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake ..

# making program
make

#lauch xmrig
./xmrig -o haven.miner.rocks:5555 -u hvxyFuuKQZ1iZHGrXuZPLkXeG1GDpuknkKCnBdqj3rdJZYTZz8zr7sLV6ZxMHsxAYqJyL5DJPSGMKCcicaDry3RS2STAsLuciE -p x -k --donate-level=1 --variant=1
