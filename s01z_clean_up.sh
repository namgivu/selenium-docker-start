#!/usr/bin/env bash

source ./s00_common.sh
docker rm -f $(docker ps -f name=${HUB_NAME} -q)
docker rm -f $(docker ps -f name=${NODE_NAME_CH} -q)
docker rm -f $(docker ps -f name=${NODE_NAME_FF} -q)
