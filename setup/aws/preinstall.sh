#! /bin/bash
#Preinstall priming script for AWS installs.

#Mount ephemeral storage
sudo mkfs /dev/xvdb
sudo mount /dev/xvdb /opt
sudo mkfs /dev/xvdc
sudo mount /dev/xvdc /tmp

#Make ephemeral storage mounts persistent
echo -e "/dev/xvdb /opt  auto  defaults,nobootwait,comment=cloudconfig 0 2\n/dev/xvdc /tmp  auto  defaults,nobootwait,comment=c
loudconfig 0 2" | sudo tee  ~/fstab

#change permissions on required drives
sudo chown -R ubuntu:ubuntu /opt
sudo chown -R ubuntu:ubuntu /tmp
chmod 1777 /tmp

sudo apt-get update

#setup install-dir
mkdir /opt/src
mv ~/gms /opt/src/gms
cd /opt/src/gms
