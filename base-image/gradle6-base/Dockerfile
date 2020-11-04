#docker build -t wwzpeople/gradle6-base .

FROM wwzpeople/openjdk11
LABEL maintainer="wildrose2405@gmail.com"

RUN su - deploy -c "sudo yum install unzip -y"

ADD https://services.gradle.org/distributions/gradle-6.4-bin.zip /home/deploy/apps

RUN chown deploy:deploy /home/deploy/apps/gradle-6.4-bin.zip

RUN su - deploy -c "mkdir /home/deploy/apps/gradle6"

RUN su - deploy -c "cd /home/deploy/apps; unzip gradle-6.4-bin.zip -d /home/deploy/apps"

RUN su - deploy -c "ln -s /home/deploy/apps/gradle-6.4 /home/deploy/apps/gradle"

RUN su - deploy -c "rm -f /home/deploy/apps/gradle-6.4-bin.zip"

USER deploy:deploy

ENV GRADLE_HOME="/home/deploy/apps/gradle-6.4"
ENV JAVA_HOME="/home/deploy/apps/java"
ENV PATH="/home/deploy/apps/gradle/bin:${PATH}"
