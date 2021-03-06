#!/bin/sh -e -x
java -Djava.library.path=/usr/local/lib:/usr/lib:/usr/lib64 \
     -Djava.util.logging.SimpleFormatter.format=%2$s%5$s%6$s%n \
     -Xmx512m -cp /usr/bin/marathon mesosphere.marathon.Main \
     --zk ${MARATHON_ZK-zk://zk:2181/marathon} \
     --master ${MESOS_MASTER-zk://zk:2181/mesos} \
     ${HTTP_PORT+--http_port $HTTP_PORT} \
     --hostname `hostname` \
     ${MARATHON_HA+--ha}
