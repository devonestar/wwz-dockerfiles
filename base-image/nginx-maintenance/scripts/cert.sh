#!/bin/bash
echo "Do ssl cert apply"
sed -i -e "s/SSL_CERTIFICATE;/$SSL_CERTIFICATE;/g" /home/deploy/services/nginx/conf/nginx-ssl.conf
sed -i -e "s/SSL_CERTIFICATE_KEY;/$SSL_CERTIFICATE_KEY;/g" /home/deploy/services/nginx/conf/nginx-ssl.conf
