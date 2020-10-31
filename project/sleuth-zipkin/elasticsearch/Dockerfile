FROM wwzpeople/openjdk11

ENV ELASTICSEARCH_VERSION 7.9.3

ADD https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz /home/deploy/apps

RUN echo -e '#openJdk11\nexport JAVA_HOME=/home/deploy/apps/java\nexport PATH=$JAVA_HOME/bin:$PATH\nexport CLASSPATH=$CLASSPATH:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar' >> /etc/profile

RUN source /etc/profile

RUN chown deploy:deploy /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz

USER deploy:deploy

RUN cd /home/deploy/apps; tar xzvf elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz

RUN rm -f /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz

COPY --chown=deploy:deploy config/elasticsearch.yml /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/

WORKDIR /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION

ENV JAVA_HOME /home/deploy/apps/java
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH $CLASSPATH:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar

# start daemon
ENTRYPOINT ["./bin/elasticsearch"]

EXPOSE 9200
