#!/bin/bash

# go to root
cd

# server update & requesting apps install
sudo yum install -y epel-release

# adding gcc repository
sudo yum install -y git make cmake gcc gcc-c++ libstdc++-static libmicrohttpd-devel libuv-static

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
cmake .. -DCMAKE_BUILD_TYPE=Release -DUV_LIBRARY=/usr/lib64/libuv.a

# making program
make

#lauch xmrig
./xmrig -o etn.fairhash.org:3333 -u etnkMYCHh8u9r81akizjijNJbJBHQfPWAHfjL5WT2z715eiHFXwz4j5XJNWwZSk6FQi6chWSQcdo7ecf13Nva9sg7VWK7QZUen -p x -k --donate-level=1
