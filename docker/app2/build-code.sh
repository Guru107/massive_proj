#!/bin/bash

rsync -av -r -c --progress ../../app2 ./ --exclude docker --exclude .git --exclude node_modules --delete-excluded

docker build --tag "hyperloop/app2_code" --rm=true --force-rm=true --no-cache=true -f code .

rm -rf ./app2
