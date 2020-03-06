#!/bin/sh

# Elastic APM requires a configuration file
# Get this sample configuration file before executing this script file (if you don't have it)
# curl -L -O https://raw.githubusercontent.com/elastic/apm-server/7.6/apm-server.docker.yml

docker run -d \
  -p 8200:8200 \
  --name apm-server \
  --user apm-server \
  --volume="$(pwd)/apm-server.docker.yml:/usr/share/apm-server/apm-server.yml:ro" \
  --link elasticsearch:elasticsearch \
  --link kibana:kibana \
  docker.elastic.co/apm/apm-server:7.6.0