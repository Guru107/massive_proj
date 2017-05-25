#!/bin/bash

SOURCE="/Users/$(whoami)/Desktop/Node/massive_proj"
DEST="/home/code"

cmd=$([ -n "$1" ] && [ $1 == "--cmd" ] && [ -n "$2" ] && echo $2 || echo "dev")

ip=$(ipconfig getifaddr en0)

docker run --add-host dockerhost:${ip} -d --name app2_code --env TIER=${cmd} -p 8090:8090 -v ${SOURCE}/app2:${DEST}/app2 -v ${SOURCE}/web_modules:${DEST}/web_modules "hyperloop/app2_code"