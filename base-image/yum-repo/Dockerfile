#docker build -t wwzpeople/centos7 .

FROM centos:centos7
MAINTAINER Dev <wildrose2405@gmail.com>

RUN rm -f /etc/yum.repos.d/*
COPY files/infra-yum.repo /etc/yum.repos.d

RUN mv /etc/localtime /etc/localtime_org
RUN ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime