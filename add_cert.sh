#!/bin/bash

source ./.env

sudo mkdir -p /usr/share/ca-certificates/mylocal/
sudo cp ./cert_server/contents/${IP_ADDRESS}.crt /usr/share/ca-certificates/mylocal/
echo mylocal/${IP_ADDRESS}.crt | sudo tee -a /etc/ca-certificates.conf
sudo update-ca-certificates

