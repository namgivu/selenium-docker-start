#!/usr/bin/env bash

#load common config
source ./s00_common.sh

#start the grid = hub + 02 nodes (chrome, firefox) via docker compose ref. https://testdetective.com/selenium-grid-with-docker/ and https://gist.github.com/lroslonek/1f5ca6af7e1fbffa914a
docker_compose="
$HUB_NAME:
  image: $HUB_DIMG
  ports:
    - 4444:4444


$NODE_NAME_CH:
  image: $NODE_DIMG_CH
  ports:
    - 5900
  links:
    - $HUB_NAME:hub

$NODE_NAME_FF:
  image: $NODE_DIMG_FF
  ports:
    - 5900
  links:
    - $HUB_NAME:hub
"

DOCKER_COMPOSE_FILE='docker-compose.yml'
echo "$docker_compose" > $DOCKER_COMPOSE_FILE
docker-compose up -d --force-recreate

echo "
Open selenium console
http://localhost:$HUB_PORT/grid/console
"