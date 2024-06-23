#!/bin/sh
set -e

# Substitute environment variables in the template

if [ "$NGINX_MODE_RANDOM" = "1" ]; then
    export NGINX_SERVER='include /etc/nginx/nginxWithProfile.conf;'
fi

envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start Nginx
# exec echo "envsubst successfull"
# exec cat /etc/nginx/nginx.conf
echo "STARTING NGINX"
exec nginx -g 'daemon off;'
