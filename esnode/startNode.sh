#!/bin/bash

NODE_NAME=${NODE_NAME:="node"}
CLUSTER_NAME=${CLUSTER_NAME:="elasticsearch"}
IS_MASTER=${IS_MASTER:=false}
IS_DATA=${IS_DATA:=true}
DISCOVERY_STRING=${DISCOVERY_STRING}
MINIMUM_MASTERS=${MINIMUM_MASTERS:=1}
HOST_IP=${HOST_IP}
TCP_PORT=${TCP_PORT:=9300}
PUBLISH_IP=${PUBLISH_IP}
HTTP_PORT=${HTTP_PORT:=9200}

# Replace the names and config before starting elasticsearch
sed -i -e "/cluster.name:*/c\cluster.name: ${CLUSTER_NAME}" -e "/node.name:*/c\node.name: ${NODE_NAME}" -e "/node.data:*/c\node.data: ${IS_DATA}" -e  "/node.master:*/c\node.master: ${IS_MASTER}" -e "s/DISCOVERY_STRING/$DISCOVERY_STRING/g"   -e "s/MINIMUM_MASTERS/$MINIMUM_MASTERS/g" -e "s/HOST_IP/$HOST_IP/g" -e "s/TCP_PORT/$TCP_PORT/g" -e "s/PUBLISH_IP/$PUBLISH_IP/g" -e "s/HTTP_PORT/$HTTP_PORT/g" /elasticsearch/config/elasticsearch.yml

cat /elasticsearch/config/elasticsearch.yml


# Start the elasticsearch node
/elasticsearch/bin/elasticsearch
