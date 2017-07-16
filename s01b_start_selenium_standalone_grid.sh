#!/usr/bin/env bash

#the names
CH_PORT=4445 #grid port for Chrome
FF_PORT=4446 #grid port for Firefox

#start the standalone grid ref. https://github.com/SeleniumHQ/docker-selenium#standalone-chrome-and-firefox
docker run -d -p $CH_PORT:4444 selenium/standalone-chrome:3.4.0-einsteinium
docker run -d -p $FF_PORT:4444 selenium/standalone-firefox:3.4.0-einsteinium
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
