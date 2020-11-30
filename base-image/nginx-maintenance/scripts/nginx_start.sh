#!/bin/bash
#Todo 개입할 여지를 여기에 준다.
FILE=/home/deploy/scripts/cert.sh

if [ -f "$FILE" ]; then
  source $FILE
fi

sudo /home/deploy/apps/nginx/sbin/nginx -g "daemon off;" -c /home/deploy/services/nginx/conf/nginx.conf