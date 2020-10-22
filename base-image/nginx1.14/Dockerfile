#docker build -t wwzpeople/nginx1.14 .

FROM wwzpeople/nginx-builder
MAINTAINER Dev <wildrose2405@gmail.com>

RUN ls -al
RUN cd /home/deploy/install/nginx-1.14.0 ; ./configure --prefix=/home/deploy/apps/nginx-1.14.0 \
              --with-http_stub_status_module    \
              --with-http_ssl_module            \
              --with-http_v2_module             \
              --with-http_secure_link_module    \
              --with-http_gzip_static_module    \
              --add-module=/home/deploy/install/headers-more-nginx-module-0.33

RUN cd /home/deploy/install/nginx-1.14.0; make

RUN cd /home/deploy/install/nginx-1.14.0; make install

RUN rm -f /home/deploy/apps/nginx-1.14.0/conf/*.default

RUN rm -rf /home/deploy/install

RUN chown deploy:deploy -R /home/deploy/apps/nginx-1.14.0

RUN su - deploy -c "mkdir -p /home/deploy/logs/nginx"

RUN su - deploy -c "mkdir -p /home/deploy/deploy/nginx"

RUN su - deploy -c "touch /home/deploy/logs/nginx/access.log"

RUN su - deploy -c "touch /home/deploy/logs/nginx/error.log"

RUN su - deploy -c "mkdir -p /home/deploy/services/nginx/conf"

RUN su - deploy -c "ln -s /home/deploy/apps/nginx-1.14.0 /home/deploy/apps/nginx"

RUN su - deploy -c "chmod 755 /home/deploy"

EXPOSE 8080 443 80

