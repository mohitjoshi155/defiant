#!/bin/bash

# Install rclone static binary
wget -q https://downloads.rclone.org/v1.51.0/rclone-v1.51.0-linux-amd64.zip
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

# Install aria2c static binary
wget -q https://github.com/q3aql/aria2-static-builds/releases/download/v1.35.0/aria2-1.35.0-linux-gnu-64bit-build1.tar.bz2
tar xf aria2-1.35.0-linux-gnu-64bit-build1.tar.bz2
export PATH=$PWD/aria2-1.35.0-linux-gnu-64bit-build1:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

# Tracker
DOWNLOADER="curl -fsSL --connect-timeout 3 --max-time 3 --retry 2"
tracker_list1=$(
            ${DOWNLOADER} https://trackerslist.com/all.txt |awk NF|sed ":a;N;s/\n/,/g;ta")
tracker_list2=$(
            ${DOWNLOADER} https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt |awk NF|sed ":a;N;s/\n/,/g;ta")
echo "bt-tracker=$tracker_list1" >> aria2c.conf
echo "bt-tracker=$tracker_list2" >> aria2c.conf
