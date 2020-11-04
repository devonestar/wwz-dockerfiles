FROM wwzpeople/openjdk11

ARG ELASTICSEARCH_VERSION

ADD https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz /home/deploy/apps

RUN echo -e '#openJdk11\nexport JAVA_HOME=/home/deploy/apps/java\nexport PATH=$JAVA_HOME/bin:$PATH\nexport CLASSPATH=$CLASSPATH:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar' >> /etc/profile

RUN source /etc/profile

RUN chown deploy:deploy /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz

RUN su - deploy -c "cd /home/deploy/apps; tar xzvf elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz"

RUN su - deploy -c "rm -f /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION-no-jdk-linux-x86_64.tar.gz"

#COPY --chown=deploy:deploy config/elasticsearch.yml /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/
COPY config/elasticsearch.yml /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/

RUN chown deploy:deploy /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/elasticsearch.yml

RUN chmod 775 /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/elasticsearch.yml

# add node.name, cluster.initial_master_nodes to config file
ARG NODE_NAME

ARG CLUSTER_INIT_MASTER_NODES

# local volume
RUN su - deploy -c "mkdir /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/data"

RUN echo -e node.name: $NODE_NAME '\n'cluster.initial_master_nodes: $CLUSTER_INIT_MASTER_NODES '\n'path.data: /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/data >> /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION/config/elasticsearch.yml

# set java path
ENV JAVA_HOME /home/deploy/apps/java

ENV PATH $JAVA_HOME/bin:$PATH

ENV CLASSPATH $CLASSPATH:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar

# run configuration
WORKDIR /home/deploy/apps/elasticsearch-$ELASTICSEARCH_VERSION
USER deploy:deploy

# start daemon
ENTRYPOINT ["./bin/elasticsearch"]
#ENTRYPOINT ["/bin/bash"]

EXPOSE 9200
