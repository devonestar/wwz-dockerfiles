#docker build -t wwzpeople/nginx-maintenance .

FROM wwzpeople/nginx1.14
LABEL maintainer="Dev <wildrose2405@gmail.com>"
#Root 설정 매인터넌스 Html 페이지로 설정
#RUN su - deploy -c "mkdir -p /home/deploy/services/nginx/conf/cert"
#
RUN su - deploy -c "cp -a /home/deploy/apps/nginx/conf/* /home/deploy/services/nginx/conf/"

COPY files/*.conf /home/deploy/services/nginx/conf/
COPY files/*.html /home/deploy/services/nginx/conf/

RUN chown -R deploy:deploy /home/deploy/services/nginx/conf/*

COPY scripts/nginx_start.sh /home/deploy/scripts/

RUN chown deploy:deploy /home/deploy/scripts/nginx_start.sh
RUN chmod 755 /home/deploy/scripts/nginx_start.sh

USER deploy

EXPOSE 80 443

ENTRYPOINT /home/deploy/scripts/nginx_start.sh