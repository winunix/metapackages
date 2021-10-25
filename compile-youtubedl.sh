#!/bin/bash

rm -rf ./youtube-dl-full/usr/local/bin/youtube-dl
mkdir -p ./youtube-dl-full/usr/local/bin/
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o ./youtube-dl-full/usr/local/bin/youtube-dl
chmod a+rx ./youtube-dl-full/usr/local/bin/youtube-dl
dpkg-deb -b youtube-dl-full .
