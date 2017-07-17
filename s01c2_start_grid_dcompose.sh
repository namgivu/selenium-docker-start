#!/usr/bin/env bash

#load common config
source ./s00_common.sh

SCALE_PARAMS=$1

#start the grid = hub + 02 nodes (chrome, firefox) via docker compose ref. https://testdetective.com/selenium-grid-with-docker/ and https://gist.github.com/lroslonek/1f5ca6af7e1fbffa914a
docker_compose="
$HUB_NAME:
  image: $HUB_DIMG
  ports:
    - 4444:4444
  #restart: always #TODO consider to put this in ref. https://gist.github.com/manoj9788/67e248064c89d622cadc6192c66b184d


$NODE_NAME_CH:
  image: $NODE_DIMG_CH
  ports:
    - 5900
  links:
    - $HUB_NAME:hub
  #restart: always #TODO consider to put this in ref. https://gist.github.com/manoj9788/67e248064c89d622cadc6192c66b184d

$NODE_NAME_FF:
  image: $NODE_DIMG_FF
  ports:
    - 5900
  links:
    - $HUB_NAME:hub
  #restart: always #TODO consider to put this in ref. https://gist.github.com/manoj9788/67e248064c89d622cadc6192c66b184d
"

DOCKER_COMPOSE_FILE='docker-compose.yml'
echo "$docker_compose" > $DOCKER_COMPOSE_FILE
docker-compose up -d --force-recreate $SCALE_PARAMS

echo "
Open selenium console
http://localhost:$HUB_PORT/grid/console
"