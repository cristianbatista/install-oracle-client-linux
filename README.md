# install-oracle-client-linux
Script to install oracle client

### Run Script
``` 
apt-get install libaio1 libaio-dev
chmod +x install.sh
./install.sh
```

## Install Oracle Client by Alien

```
wget -c http://yum.oracle.com/repo/OracleLinux/OL7/oracle/instantclient/x86_64/getPackage/oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm

sudo apt-get install alien

sudo alien -i oracle-instantclient19.3-basic-19.3.0.0.0-1.x86_64.rpm

sudo apt-get install libaio1
sudo apt-get install libaio1 libaio-dev
```
