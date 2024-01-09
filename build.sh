#!/bin/sh

set -uex pipefail

apt-get update -y
apt-get install -y build-essential cmake pkg-config qtbase5-dev qtchooser \
qt5-qmake qtbase5-dev-tools qttools5-dev qttools5-dev-tools \
libqt5svg5-dev libboost-dev libssl-dev libprotobuf-dev protobuf-compiler \
libprotoc-dev libcap-dev libxi-dev libasound2-dev libogg-dev \
libsndfile1-dev libspeechd-dev libavahi-compat-libdnssd-dev \
libxcb-xinerama0 libzeroc-ice-dev libpoco-dev g++-multilib
git clone https://github.com/mumble-voip/mumble.git /tmp/mumble
cd /tmp/mumble
git submodule update --init
mkdir build && cd build && cmake -Dclient=OFF ..
## mv mumble-server
chmod +x mumble-server
mv mumble-server /usr/local/bin
## mv config file
mkdir /etc/mumble
mv mumble-server.ini /etc/mumble
