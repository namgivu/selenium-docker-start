#!/usr/bin/env bash

#require docker-compose installed ref. https://stackoverflow.com/a/36689427/248616
curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo mv ./docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
