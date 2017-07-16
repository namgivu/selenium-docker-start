#!/usr/bin/env bash

docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.4.0-einsteinium
docker run -d --link selenium-hub:hub selenium/node-chrome:3.4.0-einsteinium
docker run -d --link selenium-hub:hub selenium/node-firefox:3.4.0-einsteinium

#clean all when needed
# docker rm -f $(docker ps -a -q)