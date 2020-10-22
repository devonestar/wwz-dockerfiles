#docker build -t wwzpeople/tomcat8.5 .

FROM wwzpeople/openjdk11
MAINTAINER Dev <wildrose2405@gmail.com>

ADD https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.38/bin/apache-tomcat-8.5.38.tar.gz /home/deploy/apps

RUN chown deploy:deploy /home/deploy/apps/apache-tomcat-8.5.38.tar.gz

#WORKDIR /assets
RUN su - deploy -c "cd /home/deploy/apps; tar xzvf apache-tomcat-8.5.38.tar.gz"

RUN su - deploy -c "ln -s /home/deploy/apps/apache-tomcat-8.5.38 /home/deploy/apps/tomcat"

RUN su - deploy -c "rm -f /home/deploy/apps/apache-tomcat-8.5.38.tar.gz"

RUN su - deploy -c "mkdir -p /home/deploy/services/tomcat"

RUN su - deploy -c "mkdir -p /home/deploy/data/tomcat"

RUN su - deploy -c "mkdir -p /home/deploy/services/tomcat/conf"

RUN su - deploy -c "mkdir -p /home/deploy/logs/tomcat"

COPY files/ServerInfo.properties /home/deploy/apps/tomcat/lib/org/apache/catalina/util/ServerInfo.properties

RUN chown deploy:deploy /home/deploy/apps/tomcat/lib/org/apache/catalina/util/ServerInfo.properties

RUN su - deploy -c "cp /home/deploy/apps/tomcat/conf/* /home/deploy/services/tomcat/conf/"

COPY files/server.xml /home/deploy/services/tomcat/conf/

RUN chown deploy:deploy /home/deploy/services/tomcat/conf/server.xml

COPY files/startup.sh /home/deploy/scripts

RUN chown deploy:deploy /home/deploy/scripts/startup.sh

RUN chmod 755 /home/deploy/scripts/startup.sh

EXPOSE 8080