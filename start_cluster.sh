# Stop es docker containers
sudo docker stop es1
sudo docker stop es2
# Remove es docker containers
sudo docker rm es1
sudo docker rm es2
# Start Master node
sudo docker run --name es1 -d -P -v /var/log/elasticsearch/es1/data:/data -v /var/log/elasticsearch/es1/supervisor:/var/log/supervisor -e NODE_NAME=node.master -e CLUSTER_NAME=mycluster1 -e IS_MASTER=true -e IS_DATA=false veeresh/elasticsearch
# Start data node
sudo docker run --name es2 -d -P -v /var/log/elasticsearch/es2/data:/data -v /var/log/elasticsearch/es2/supervisor:/var/log/supervisor -e NODE_NAME=node.data -e CLUSTER_NAME=mycluster1 -e IS_MASTER=false -e IS_DATA=true veeresh/elasticsearch
