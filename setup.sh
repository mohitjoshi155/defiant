#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

# Install aria2c static binary
wget -q https://raw.githubusercontent.com/pctechkid/5rp2eeph3k/master/yourfilehere.tar.bz2
tar xf yourfilehere.tar.bz2
export PATH=$PWD/yourfilehere:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

# Tracker
tracker_list=$(wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt |awk NF|sed ":a;N;s/\n/,/g;ta")
echo "bt-tracker=$tracker_list" >> aria2c.conf
