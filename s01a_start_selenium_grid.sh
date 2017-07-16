#!/usr/bin/env bash

#the names
HUB_PORT=4444

#start the grid = hub + 02 nodes (chrome, firefox) ref. https://github.com/SeleniumHQ/docker-selenium#selenium-grid-hub-and-nodes
docker run -d -p $HUB_PORT:4444 --name selenium-hub selenium/hub:3.4.0-einsteinium
docker run -d --link selenium-hub:hub selenium/node-chrome:3.4.0-einsteinium
docker run -d --link selenium-hub:hub selenium/node-firefox:3.4.0-einsteinium
sleep 1 #wait the service to come up in full

#aftermath check
echo ; sleep 1
urlGridConsole="http://localhost:$HUB_PORT/grid/console"
curl -s $urlGridConsole | grep -o -P ".{0,11}Grid Console.{0,22}"

#clean all when needed
# docker rm -f $(docker ps -a -q)
