#!/bin/bash

rsync -av -r -c --progress ../../app1/package.json ./
rsync -av -r -c --progress ~/.ssh ./

docker build --tag "hyperloop/app1_modules" --rm=true --force-rm=true --no-cache=true -f app1_modules .

rm -rf ./package.json
rm -rf ./.ssh