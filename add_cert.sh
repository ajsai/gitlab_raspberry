#!/bin/bash

IP_ADDRESS=`curl https://raw.githubusercontent.com/ajsai/gitlab_raspberry/master/.env | grep IP_ADDRESS | sed "s/^.*=//"`
curl -o ${IP_ADDRESS}.crt https://raw.githubusercontent.com/ajsai/gitlab_raspberry/master/${IP_ADDRESS}.crt
sudo mkdir -p /usr/share/ca-certificates/mylocal/
sudo cp ${IP_ADDRESS}.crt /usr/share/ca-certificates/mylocal/
echo mylocal/${IP_ADDRESS}.crt | sudo tee -a /etc/ca-certificates.conf
sudo update-ca-certificates

