#!/bin/bash

mkdir -p /etc/nginx/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048\
		-out /etc/nginx/certs/cert.crt \
		-keyout /etc/nginx/certs/cert.key \
		-subj "/C=BR/ST=São Paulo/L=São Paulo/O=42SP/OU=Inception/CN=bluiz-al/"

sed -i "s|DOMAIN_NAME|${DOMAIN_NAME}|g" /etc/nginx/conf.d/nginx.conf
sed -i "s|CERTS_|/etc/nginx/certs|g" /etc/nginx/conf.d/nginx.conf

exec "$@"