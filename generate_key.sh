#!/bin/bash

# read from .env
set -a; eval "$(cat ./.env <(echo) <(declare -x))"; set +a;

#IP_ADDRESS=192.168.10.2
SERVER_NAME=$IP_ADDRESS

rm -rf *.key
rm -rf *.csr
rm -rf *.crt

cat <<_MY_CONF_ > mycert.cnf
[ req ]
default_bits = 2048
default_md = sha256
prompt = no
encrypt_key = no
distinguished_name = dn
req_extensions = v3_req

[ dn ]
C = JP
O = $SERVER_NAME
CN = $SERVER_NAME

[ v3_req ]
subjectAltName = @alt_names

[ alt_names ]
IP.1 = $IP_ADDRESS
# マルチドメイン用の証明書の場合
#DNS.1 = example.com
#DNS.2 = www.example.com
#DNS.3 = hoge.example.com
#DNS.4 = fuga.example.com

_MY_CONF_

# 証明書要求の作成
sudo openssl req -new -config mycert.cnf -keyout server.key -out server.csr

# 署名
sudo openssl x509 -days 365 -extensions v3_req -req -signkey server.key -extensions v3_req -extfile mycert.cnf < server.csr > server.crt

# リネーム
mv server.key $IP_ADDRESS.key
mv server.crt $IP_ADDRESS.crt

# 署名要求はもう不要なので削除
rm -rf server.csr
