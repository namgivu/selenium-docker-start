#!/usr/bin/env bash

#load common config
source ./s00_common.sh

./s01c2_start_grid_dcompose.sh "--scale $NODE_NAME_CH=2 --scale $NODE_NAME_FF=1"
