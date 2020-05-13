#!/usr/bin/env bash

### Install nginx ### 
apt update
apt install -y nginx

### Configure nginx ### 

# Stop nginx service
service nginx stop

# Remove default conf of nginx
[ -f /etc/nginx/sites-available/default ] && {
 rm -fr /etc/nginx/sites-available/default
}

# Copy the new nginx conf
cat <<EOF > /etc/nginx/sites-available/default
# Default server configuration

server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}
}

server {

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;
    server_name atanas.web.bg.hashicorp-success.com; # managed by Certbot


	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}


    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/atanas.web.bg.hashicorp-success.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/atanas.web.bg.hashicorp-success.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = atanas.web.bg.hashicorp-success.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	listen 80 ;
	listen [::]:80 ;
    server_name $1; #atanas.web.bg.hashicorp-success.com
    return 404; # managed by Certbot
}
EOF
© 2020 GitHub, Inc.
