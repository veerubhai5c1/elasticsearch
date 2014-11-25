FROM java:7

# Install ElasticSearch.
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz && \
  tar xvzf elasticsearch-1.3.2.tar.gz && \
  rm -f elasticsearch-1.3.2.tar.gz && \
  mv /tmp/elasticsearch-1.3.2 /elasticsearch
# Install supervisor
RUN apt-get install -y supervisor

# Get Kafka/river plugin
RUN wget https://s3-us-west-1.amazonaws.com/nirmata-elasticsearch/elasticsearch-river-kafka-1.0.2-SNAPSHOT.zip > /tmp/elasticsearch-river-kafka-1.0.2-SNAPSHOT.zip
RUN /elasticsearch/bin/plugin -remove elasticsearch-river-kafka
# RUN mkdir /plugins/river-kafka/_site
# RUN /elasticsearch/bin/plugin -url file:///tmp/elasticsearch-river-kafka-1.0.2-SNAPSHOT.zip -install elasticsearch-river-kafka
# Define mountable directories.
VOLUME ["/data"]
# Define working directory.
WORKDIR /data

# ADD elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
# ADD supervisord
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /run.sh
ADD startNode.sh /startNode.sh
ADD plugin.sh /plugin.sh
RUN chmod 0755 /*.sh

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/run.sh"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
