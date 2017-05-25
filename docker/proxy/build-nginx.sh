#!/bin/bash

docker build --tag "hyperloop/nginx" --rm=true --force-rm=true --no-cache=true .
