# Stop es docker containers
sudo docker stop es1
sudo docker stop es2
# Remove es docker containers
sudo docker rm es1
sudo docker rm es2
DISCOVERY_STRING="[\"192.168.123.166[9300-9301]\"]"
MINIMUM_MASTERS=1
HOST_IP=_non_loopback_:ipv4_
PUBLISH_IP=192.168.123.165
# Start Master node
sudo docker run --name es1 -d -p 9200:9200 -p 9300:9300 -v /var/log/elasticsearch/es1/data:/data -v /var/log/elasticsearch/es1/supervisor:/var/log/supervisor -e NODE_NAME=node.master.165 -e CLUSTER_NAME=mycluster1 -e IS_MASTER=true -e IS_DATA=false -e DISCOVERY_STRING=$DISCOVERY_STRING -e MINIMUM_MASTERS=$MINIMUM_MASTERS -e HOST_IP=$HOST_IP -e TCP_PORT=9300 -e PUBLISH_IP=$PUBLISH_IP -e HTTP_PORT=9200 registry.nirmata.com/nirmata/elasticsearch
# Start data node
#sudo docker run --name es2 -d -p 9201:9200 -p 9301:9300 -v /var/log/elasticsearch/es2/data:/data -v /var/log/elasticsearch/es2/supervisor:/var/log/supervisor -e NODE_NAME=node.data.165 -e CLUSTER_NAME=mycluster1 -e IS_MASTER=false -e IS_DATA=true -e DISCOVERY_STRING=$DISCOVERY_STRING registry.nirmata.com/nirmata/elasticsearch
