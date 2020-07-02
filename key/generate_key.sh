#!/bin/sh

openssl genrsa -out gitlab.key 2048
openssl req -new -key gitlab.key -out gitlab.csr
openssl x509 -req -days 3650 -in gitlab.csr -signkey gitlab.key -out gitlab.crt
openssl dhparam -out dhparam.pem 2048

