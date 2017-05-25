#!/bin/bash

rsync -av -r -c --progress ../../web_modules ./ --exclude .git --exclude node_modules --delete-excluded

docker build --tag "hyperloop/web_modules" --rm=true --force-rm=true --no-cache=true -f code .

rm -rf ./web_modules
