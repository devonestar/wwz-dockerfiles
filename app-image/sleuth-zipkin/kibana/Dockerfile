FROM wwzpeople/centos7-deploy-user

ARG KIBANA_VERSION

ADD https://artifacts.elastic.co/downloads/kibana/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz /home/deploy/apps

RUN chown deploy:deploy /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz

RUN su - deploy -c "cd /home/deploy/apps; tar xzvf kibana-$KIBANA_VERSION-linux-x86_64.tar.gz"

RUN su - deploy -c "rm -f /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64.tar.gz"

# COPY --chown=deploy:deploy config/kibana.yml /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64/config/
COPY config/kibana.yml /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64/config/

RUN chown deploy:deploy /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64/config/kibana.yml

RUN chmod 775 /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64/config/kibana.yml

WORKDIR /home/deploy/apps/kibana-$KIBANA_VERSION-linux-x86_64

USER deploy:deploy

#start daemon
ENTRYPOINT ["./bin/kibana"]

EXPOSE 5601
