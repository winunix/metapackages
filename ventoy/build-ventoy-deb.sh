#!/bin/bash

VERSION="1.0.74"

if [ ! -f ventoy-$VERSION-linux.tar.gz ]; then
    wget "https://github.com/ventoy/Ventoy/releases/download/v$VERSION/ventoy-$VERSION-linux.tar.gz"
fi
tar -xvf ventoy-$VERSION-linux.tar.gz
rm -rf pkg/usr/share/ventoy
mv ventoy-$VERSION pkg/usr/share/ventoy
rm -rf pkg/usr/share/ventoy/*.{aarch64,i386,mips64el}
rm -rf pkg/usr/share/ventoy/tool/{aarch64,i386,mips64el}
sed "s/VENTOYVERSION/$VERSION/g" appdata.xml > pkg/usr/share/metainfo/net.ventoy.appdata.xml
cp ventoyd pkg/usr/share/ventoy/
dpkg-deb -b pkg/ .