#!/bin/sh
GOPATH=${PWD}

cd $GOPATH/resources

wget https://raw.githubusercontent.com/thdatcs/go-oracle/master/libs/instantclient-basic-linux.x64-12.2.0.1.0.zip
wget https://raw.githubusercontent.com/thdatcs/go-oracle/master/libs/instantclient-sdk-linux.x64-12.2.0.1.0.zip

unzip -o instantclient-basic-linux.x64-12.2.0.1.0.zip
unzip -o instantclient-sdk-linux.x64-12.2.0.1.0.zip

cp ./instantclient_12_2/libclntsh.so.12.1 ./instantclient_12_2/libclntsh.so
cp ./instantclient_12_2/libclntshcore.so.12.1 ./instantclient_12_2/libclntshcore.so

rm instantclient-basic-linux.x64-12.2.0.1.0.zip
rm instantclient-sdk-linux.x64-12.2.0.1.0.zip

cp -p oci8.pc /usr/lib/pkgconfig
cp -p oci8.conf /etc/ld.so.conf.d
ldconfig

cd $GOPATH