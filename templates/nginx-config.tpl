#!/usr/bin/env bash

# download required ssl certificate files
mkdir -p /etc/letsencrypt/live/atanas.web.bg.hashicorp-success.com
curl -o /etc/letsencrypt/live/atanas.web.bg.hashicorp-success.com/fullchain.pem https://raw.githubusercontent.com/achuchulev/terraform-aws-nginx-tls/master/certificates/fullchain.pem
curl -o /etc/letsencrypt/live/atanas.web.bg.hashicorp-success.com/privkey.pem https://raw.githubusercontent.com/achuchulev/terraform-aws-nginx-tls/master/certificates/privkey.pem
curl -o /etc/letsencrypt/ssl-dhparams.pem https://raw.githubusercontent.com/achuchulev/terraform-aws-nginx-tls/master/certificates/ssl-dhparams.pem
curl -o /etc/letsencrypt/options-ssl-nginx.conf https://raw.githubusercontent.com/achuchulev/terraform-aws-nginx-tls/master/configuration/options-ssl-nginx.conf

# install nginx and run configuration script
curl -o /root/nginx.sh https://raw.githubusercontent.com/achuchulev/terraform-aws-nginx-tls/master/configuration/nginx.sh
chmod +x /root/nginx.sh
/root/nginx.sh
