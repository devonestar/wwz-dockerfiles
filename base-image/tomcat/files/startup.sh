# INIT
WAS_HTTP_PORT="$WAS_HTTP_PORT"

CATALINA_HOME="/home/deploy/apps/tomcat"
CATALINA_BASE="/home/deploy/services/tomcat"
CATALINA_PID="$CATALINA_BASE/catalina.pid"
CATALINA_TMP_DIR=$CATALINA_BASE/temp
LOG_DIR="/home/deploy/logs/tomcat"
JAVA_HOME="/home/deploy/apps/java"

# memory
export JAVA_OPTS="-server"

GC_OPTS="-Xms$MIM_MEM -Xmx$MAX_MEM -XX:MetaspaceSize=$META_SIZE
-XX:NewSize=$NEW_SIZE
-XX:MaxNewSize=$MAX_NEW_SIZE
-XX:+UseG1GC
-XX:MaxGCPauseMillis=$MAX_GC_PAUSE_TIME
-XX:InitiatingHeapOccupancyPercent=$IHOP
-XX:ParallelGCThreads=$P_GC_THREAD
-XX:ConcGCThreads=$C_GC_THREAD"

SPRING_OPTS="-Dspring.profiles.active=$PHASE -Dapplication.type=$APP_TYPE"
# project env
export JAVA_OPTS="$SPRING_OPTS"
export JAVA_OPTS="$JAVA_OPTS $GC_OPTS"

# GC logging
#export JAVA_OPTS="$JAVA_OPTS -verbosegc"
#export JAVA_OPTS="$JAVA_OPTS -Xlog:gc*:file=logs/gc.log::filecount=20,filesize=1M"

# tomcat
export JAVA_OPTS="$JAVA_OPTS -Dtomcat.log.dir=$LOG_DIR"
export JAVA_OPTS="$JAVA_OPTS -Dtomcat.port.http=$WAS_HTTP_PORT"
export JAVA_OPTS="$JAVA_OPTS -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager"
export JAVA_OPTS="$JAVA_OPTS -Djava.security.egd=file:/dev/urandom"

# etc
export JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=utf8"
export JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
export JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv6Addresses=false"
export JAVA_OPTS="$JAVA_OPTS -Dsun.net.inetaddr.ttl=0"
export JAVA_OPTS="$JAVA_OPTS -Dnetworkaddress.cache.ttl=0"


export CATALINA_HOME=$CATALINA_HOME
export CATALINA_PID=$CATALINA_PID
export CATALINA_BASE=$CATALINA_BASE
export CATALINA_TMPDIR=$CATALINA_TMP_DIR
export CATALINA_OUT=$LOG_DIR/catalina.out
export JAVA_HOME=$JAVA_HOME

echo "################################# TOMCAT START"

# Start tomcat
$CATALINA_HOME/bin/catalina.sh run