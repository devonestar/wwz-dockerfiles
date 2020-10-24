#docker build -t wwzpeople/centos7-deploy-user .

FROM wwzpeople/centos7
MAINTAINER Dev <wildrose2405@gmail.com>

RUN yum install netstat su sudo -y

RUN adduser deploy -u 1100

RUN echo 'deploy  ALL=NOPASSWD: ALL, !/sbin/reboot, !/usr/bin/reboot, !/sbin/shutdown, !/sbin/halt, !/usr/bin/halt, !/sbin/poweroff, !/usr/bin/poweroff, !/sbin/init, !/usr/sbin/adduser, !/usr/sbin/useradd, !/usr/sbin/userdel, !/usr/bin/passwd' >> /etc/sudoers
RUN su - deploy -c "mkdir apps"
RUN su - deploy -c "mkdir logs"
RUN su - deploy -c "mkdir scripts"
RUN su - deploy -c "mkdir data"
RUN su - deploy -c "mkdir services"