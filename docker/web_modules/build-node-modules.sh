#!/bin/bash

rsync -av -r -c --progress ../../web_modules/package.json ./
rsync -av -r -c --progress ~/.ssh ./

docker build --tag "hyperloop/web_node_modules" --rm=true --force-rm=true --no-cache=true -f modules .

rm -rf ./package.json
rm -rf ./.ssh