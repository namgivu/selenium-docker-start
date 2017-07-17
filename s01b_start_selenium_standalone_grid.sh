#!/usr/bin/env bash

#load common config
source ./s00_common.sh

#start the standalone grid
#docker run ref. https://github.com/SeleniumHQ/docker-selenium#standalone-chrome-and-firefox
#param -v and --shm-size ref. https://github.com/SeleniumHQ/docker-selenium#running-the-images
docker run -d -p $CH_PORT:4444 -v /dev/shm:/dev/shm   $STANDALONE_CH
docker run -d -p $FF_PORT:4444 --shm-size 2g          $STANDALONE_FF
sleep 1 #wait the service to come up in full

#aftermath check
echo ;
urlCH="http://localhost:$CH_PORT/grid/console"
curl -s $urlCH | grep -o -P ".{0,11}Standalone.{0,22}"
echo ;
urlFF="http://localhost:$FF_PORT/grid/console"
curl -s $urlFF | grep -o -P ".{0,11}Standalone.{0,22}"

#clean all when needed
# docker rm -f $(docker ps -a -q)
