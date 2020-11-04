FROM wwzpeople/nginx1.14
MAINTAINER Dev <wildrose2405@gmail.com>

RUN su - deploy -c "mkdir -p /home/deploy/services/nginx/conf"

RUN su - deploy -c "cp -a /home/deploy/apps/nginx/conf/* /home/deploy/services/nginx/conf/"

COPY files/* /home/deploy/services/nginx/conf/
COPY scripts/nginx_start.sh /home/deploy/scripts/

RUN chown deploy:deploy /home/deploy/services/nginx/conf/*
RUN chown deploy:deploy /home/deploy/scripts/nginx_start.sh

#RUN chmod 400 /home/deploy/services/nginx/conf/*.crt
#RUN chmod 400 /home/deploy/services/nginx/conf/*.key
RUN chmod 755 /home/deploy/scripts/nginx_start.sh

USER deploy

EXPOSE 80 443

ENTRYPOINT /home/deploy/scripts/nginx_start.sh