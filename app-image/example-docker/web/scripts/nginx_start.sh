#!/bin/bash

sed -i -e "s/APP_NAME/$APP_NAME/g" /home/deploy/services/nginx/conf/upstream.conf
sed -i -e "s/WEB_SERVER_NAME/$SERVER_DOMAIN/g" /home/deploy/services/nginx/conf/nginx.conf
#sed -i -e "s/SSL_CERTIFICATE/$SSL_CERTIFICATE/g" /home/deploy/services/nginx/conf/nginx-ssl.conf
#sed -i -e "s/SSL_CERTIFICATE_KEY/$SSL_CERTIFICATE_KEY/g" /home/deploy/services/nginx/conf/nginx-ssl.conf

sudo /home/deploy/apps/nginx/sbin/nginx -g "daemon off;" -c /home/deploy/services/nginx/conf/nginx.conf