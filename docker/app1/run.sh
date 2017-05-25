#!/bin/bash

SOURCE="/Users/$(whoami)/Desktop/Node/massive_proj"
DEST="/home/code"

cmd=$([ -n "$1" ] && [ $1 == "--cmd" ] && [ -n "$2" ] && echo $2 || echo "dev")

ip=$(ipconfig getifaddr en0)

docker run --add-host dockerhost:${ip} -d --name app1_code --env TIER=${cmd} -p 8080:8080 -v ${SOURCE}/app1:${DEST}/app1 -v ${SOURCE}/web_modules:${DEST}/web_modules "hyperloop/app1_code"

