#!/bin/bash

rsync -av -r -c --progress ../../app2/package.json ./
rsync -av -r -c --progress ~/.ssh ./

docker build --tag "hyperloop/app2_modules" --rm=true --force-rm=true --no-cache=true -f app2_modules .

rm -rf ./package.json
rm -rf ./.ssh