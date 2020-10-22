#!/bin/sh

JAVA_HOME="/home/deploy/apps/java"

WAS_HTTP_PORT="$SERVICE_PORT"
# memory
export JAVA_OPTS="-server -Dserver.port=$WAS_HTTP_PORT"

export JAVA_OPTS="$JAVA_OPTS -Xms$MIM_MEM"
export JAVA_OPTS="$JAVA_OPTS -Xmx$MAX_MEM"
export JAVA_OPTS="$JAVA_OPTS -XX:MetaspaceSize=$META_SIZE"
export JAVA_OPTS="$JAVA_OPTS -XX:NewSize=$NEW_SIZE"
export JAVA_OPTS="$JAVA_OPTS -XX:MaxNewSize=$MAX_NEW_SIZE"

# GC
export JAVA_OPTS="$JAVA_OPTS -XX:+UseG1GC"
export JAVA_OPTS="$JAVA_OPTS -XX:MaxGCPauseMillis=$MAX_GC_PAUSE_TIME"
export JAVA_OPTS="$JAVA_OPTS -XX:InitiatingHeapOccupancyPercent=$IHOP"
export JAVA_OPTS="$JAVA_OPTS -XX:ParallelGCThreads=$P_GC_THREAD"
export JAVA_OPTS="$JAVA_OPTS -XX:ConcGCThreads=$C_GC_THREAD"

export JAVA_OPTS="$JAVA_OPTS $CUSTOM_OPTIONS"


# project env
export JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=$PHASE"
export JAVA_OPTS="$JAVA_OPTS -Dspring.pid.file=$PID_PATH"
export JAVA_OPTS="$JAVA_OPTS -Dlogging.file=$LOG_PATH"
# export JAVA_OPTS="$JAVA_OPTS -Dmanagement.server.port={{management_port}}"

export JAVA_OPTS="$JAVA_OPTS -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"
export JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/./urandom"

export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=utf8"
export JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
export JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv6Addresses=false"
export JAVA_OPTS="$JAVA_OPTS -Dsun.net.inetaddr.ttl=0"
export JAVA_OPTS="$JAVA_OPTS -Dnetworkaddress.cache.ttl=0"


echo "Start with $SOURCE state !!!!!!!!!!!!"

# Start tomcat
$JAVA_HOME/bin/java $JAVA_OPTS -jar /home/deploy/services/boot/webapps/application.jar 1>/dev/null 2>&1