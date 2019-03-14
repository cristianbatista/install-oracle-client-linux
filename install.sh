#!/usr/bin/env bash

set -e

BP_DIR=$HOME
CLIENT_BUILD_DIR=$BP_DIR/oracle-client

echo "-----> Installing Oracle Client"

mkdir -p $CLIENT_BUILD_DIR

cd $CLIENT_BUILD_DIR
curl -s -S -L https://github.com/PaulCampbell/docker-node-oracle/raw/master/oracle/linux/instantclient-basic-linux.x64-12.1.0.2.0.zip > instantclient-basic-linux.x64-12.1.0.2.0.zip
curl -s -S -L https://github.com/PaulCampbell/docker-node-oracle/raw/master/oracle/linux/instantclient-sdk-linux.x64-12.1.0.2.0.zip > instantclient-sdk-linux.x64-12.1.0.2.0.zip
unzip instantclient-basic-linux.x64-12.1.0.2.0.zip && rm instantclient-basic-linux.x64-12.1.0.2.0.zip
unzip instantclient-sdk-linux.x64-12.1.0.2.0.zip && rm instantclient-sdk-linux.x64-12.1.0.2.0.zip
mv instantclient{_12_1,}
cd instantclient
ln -s libclntsh.so.12.1 libclntsh.so
ln -s libocci.so.12.1 libocci.so

cat <<EOT >> $BP_DIR/.bashrc
export LD_LIBRARY_PATH=$CLIENT_BUILD_DIR/instantclient/:$BUILD_DIR/.apt/lib/x86_64-linux-gnu/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export OCI_LIB_DIR=$CLIENT_BUILD_DIR/instantclient
export OCI_INC_DIR=$CLIENT_BUILD_DIR/instantclient/sdk/include
export ORACLE_HOME=$CLIENT_BUILD_DIR/instantclient
EOT

cat $BP_DIR/.bashrc

source $BP_DIR/.bashrc

echo "-----> Oracle Client Installed"
