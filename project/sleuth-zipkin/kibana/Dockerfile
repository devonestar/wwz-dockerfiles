FROM wwzpeople/centos7-deploy-user

ENV KIBANA_VERSION 7.9.3

ADD https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz /home/deploy/apps

RUN chown deploy:deploy /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz

USER deploy:deploy

RUN cd /home/deploy/apps; tar xzvf kibana-$KIBANA_VERSION-linux-x86_64.tar.gz

RUN rm -f /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz

COPY --chown=deploy:deploy config/kibana.yml /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64/config/

WORKDIR /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64

#start daemon
ENTRYPOINT ["./bin/kibana"]

EXPOSE 5601
