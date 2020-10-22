#docker build -t wwzpeople/boot-base .

FROM wwzpeople/openjdk11
MAINTAINER Dev <wildrose2405@gmail.com>


RUN su - deploy -c "mkdir -p /home/deploy/services/boot/webapps"

RUN su - deploy -c "mkdir -p /home/deploy/services/boot/temp"

RUN su - deploy -c "mkdir -p /home/deploy/logs/boot"

COPY ./startup.sh /home/deploy/scripts

RUN chmod 755 /home/deploy/scripts/startup.sh

RUN chown deploy:deploy /home/deploy/scripts/startup.sh

EXPOSE 8080