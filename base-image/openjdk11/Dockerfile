#docker build -t wwzpeople/openjdk11 .

FROM wwzpeople/centos7-deploy-user
MAINTAINER Dev <wildrose2405@gmail.com>

ADD https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz /home/deploy/apps

RUN chown deploy:deploy /home/deploy/apps/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz

RUN su - deploy -c "mkdir /home/deploy/apps/jdk11"

RUN su - deploy -c "cd /home/deploy/apps; tar xzvf OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz -C /home/deploy/apps/jdk11 --strip-components=1"

RUN su - deploy -c "ln -s /home/deploy/apps/jdk11 /home/deploy/apps/java"

RUN su - deploy -c "rm -f /home/deploy/apps/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz"