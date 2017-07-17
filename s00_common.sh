#!/usr/bin/env bash

HUB_PORT=4444
HUB_NAME='selenium-hub'

CH_PORT=4445 #grid port for Chrome
FF_PORT=4446 #grid port for Firefox
NODE_NAME_CH='selenium-node-ch'
NODE_NAME_FF='selenium-node-ff'

    HUB_DIMG='selenium/hub:3.4.0-einsteinium'
NODE_DIMG_CH='selenium/node-chrome:3.4.0-einsteinium'
NODE_DIMG_FF='selenium/node-firefox:3.4.0-einsteinium'

STANDALONE_CH='selenium/standalone-chrome:3.4.0-einsteinium'
STANDALONE_FF='selenium/standalone-firefox:3.4.0-einsteinium'
