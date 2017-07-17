#!/usr/bin/env bash

#load common config
source ./s00_common.sh

#start the grid = hub + 02 nodes (chrome, firefox) ref. https://github.com/SeleniumHQ/docker-selenium#selenium-grid-hub-and-nodes
docker run -d -p $HUB_PORT:4444 --name $HUB_NAME $HUB_DIMG
docker run -d --name $NODE_NAME_CH --link $HUB_NAME:hub $NODE_DIMG_CH
docker run -d --name $NODE_NAME_FF --link $HUB_NAME:hub $NODE_DIMG_FF
sleep 1 #wait the service to come up in full

#aftermath check
echo ; sleep 1
urlGridConsole="http://localhost:$HUB_PORT/grid/console"
curl -s $urlGridConsole | grep -o -P ".{0,11}Grid Console.{0,22}"

#clean all when needed
# docker rm -f $(docker ps -a -q)
