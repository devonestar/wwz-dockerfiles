#docker build -t wwzpeople/nginx-builder .

FROM wwzpeople/centos7-deploy-user
MAINTAINER Dev <wildrose2405@gmail.com>

RUN yum -y install make gcc pcre pcre-devel zlib zlib-devel perl sudo libssl-dev openssl openssl-devel gcc64*

RUN mkdir -p /home/deploy/install

ADD http://nginx.org/download/nginx-1.14.0.tar.gz /home/deploy/install

ADD https://github.com/agentzh/headers-more-nginx-module/archive/v0.33.tar.gz /home/deploy/install

RUN mkdir -p /home/deploy/apps/nginx-1.14.0
RUN mkdir -p /home/deploy/install/nginx-1.14.0
RUN mkdir -p /home/deploy/install/headers-more-nginx-module-0.33

RUN tar xzvf /home/deploy/install/nginx-1.14.0.tar.gz -C /home/deploy/install/nginx-1.14.0 --strip-components=1
RUN tar xzvf /home/deploy/install/v0.33.tar.gz -C /home/deploy/install/headers-more-nginx-module-0.33 --strip-components=1