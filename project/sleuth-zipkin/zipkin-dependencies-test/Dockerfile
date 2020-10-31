FROM wwzpeople/openjdk11

ENV ZIPKIN_DEPENDENCIED_VERSION 2.5.0

# 압축 파일로 다운받는 방법 확인하기
# ADD https://github.com/openzipkin/zipkin-dependencies/releases/????/zipkin-dependencies-release-2.5.0.tar.gz
# ADD https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.8%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.8_10.tar.gz /home/deploy/apps

USER deploy:deploy

RUN mkdir /home/deploy/apps/zipkin-dependencies-${ZIPKIN_DEPENDENCIED_VERSION}

# jar file 직접 설치
RUN curl -sSL https://zipkin.io/quickstart.sh | bash -s io.zipkin.dependencies:zipkin-dependencies:${ZIPKIN_DEPENDENCIED_VERSION} /home/deploy/apps/zipkin-dependencies-${ZIPKIN_DEPENDENCIED_VERSION}/zipkin-dependencies.jar

# 다운로드 확인
# RUN ls -al /home/deploy/apps

# Adds coreutils to allow date formatting of 'yesterday'
# ?? 이거 뭔지 알아내기
# RUN apk add --no-cache coreutils

# RUN ls -al /etc/periodic

RUN pwd

COPY --chown=deploy:deploy periodic/ /etc/periodic

RUN ls -al /etc/periodic

# COPY --chown=deploy:deploy --from=install bin/ /tmp/docker-bin/

# 실행 스크립트 이동
# RUN mv /tmp/docker-bin/start-zipkin-dependencies.sh.sh /usr/local/bin/ && \
#    rm -rf /tmp/docker-bin
 
COPY --chown=deploy:deploy bin/ /home/deploy/apps/zipkin-dependencies-${ZIPKIN_DEPENDENCIED_VERSION}/bin/

# RUN chmod g+w home/deploy/apps/zipkin-dependencies/bin
    
WORKDIR /home/deploy/apps/zipkin-dependencies-${ZIPKIN_DEPENDENCIED_VERSION}
# Use to set heap, trust store or other system properties.

# ENV ES_NODES_WAN_ONLY="true"

RUN chmod 755 ./bin/start-zipkin-dependencies.sh

#ENV JAVA_HOME /home/deploy/apps/java
#ENV PATH $JAVA_HOME/bin:$PATH
#ENV CLASSPATH $CLASSPATH:$JAVA_HOME/jre/lib/ext:$JAVA_HOME/lib/tools.jar

ENTRYPOINT /bin/bash

# ENTRYPOINT ["/bin/bash", "-c", "./bin/start-zipkin-dependencies.sh"]
