#!/bin/bash
## 只支持 Xenial 16.04 and newer Trusty 14.04

sudo apt-get remove docker docker-engine docker.io

release=$(lsb_release -r|grep -oP '\d+\.\d+')

if [ "$release" == "14.04" ]; then
	sudo apt-get update
	sudo apt-get install \
		linux-image-extra-$(uname -r) \
		linux-image-extra-virtual
fi

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce

sudo usermod -aG docker ubuntu
