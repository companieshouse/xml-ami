#!/bin/bash
# Script to configure, make and install openssl and python 3.7

echo "Downaload and setup Openssl 1.1.1"
echo ""

echo "Downaload Openssl 1.1.1"
echo ""
cd /usr/src/
curl -O -L https://github.com/openssl/openssl/archive/OpenSSL_1_1_1c.tar.gz
tar -zxvf OpenSSL_1_1_1c.tar.gz
cd openssl-OpenSSL_1_1_1c

echo "Configure Openssl 1.1.1"
echo ""
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib

echo "Make Openssl 1.1.1"
echo ""
make

echo "Install Openssl 1.1.1"
echo ""
make install

echo "Pass /usr/src/openssl-OpenSSL_1_1_1c into the Python configure script"
echo ""
mkdir lib
cp ./*.{so,so.1.1,a,pc} ./lib

echo "Add new versoin to Path"
echo ""
echo "pathmunge /usr/local/openssl/bin" > /etc/profile.d/openssl.sh

echo "Link libraries"
echo ""
echo "/usr/local/openssl/lib" > /etc/ld.so.conf.d/openssl-1.1.1c.conf
ldconfig -v

mv /usr/bin/openssl /root/
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl

echo "Openssl versions:"
openssl version
echo ""

echo "Downaload and setup Python 3.7.0"
echo ""

echo "Downaload Python 3.7.0"
echo ""
cd /usr/src
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar xzf Python-3.7.0.tgz
cd Python-3.7.0

echo "Configure Python 3.7.0"
echo ""
./configure --with-openssl=/usr/src/openssl-OpenSSL_1_1_1c --enable-optimizations
    
echo "Make Python 3.7.0"
echo ""
make

echo "Install Python 3.7.0"
echo ""
make altinstall
