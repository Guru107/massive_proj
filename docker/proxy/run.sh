#!/bin/bash

SOURCE="/Users/$(whoami)/Desktop/Node/massive_proj"
DEST="/home/code"

cmd=$([ -n "$1" ] && [ $1 == "--cmd" ] && [ -n "$2" ] && echo $2 || echo "dev")

#echo "show State:/Network/Global/IPv4" | scutil | grep PrimaryInterface | awk '{print $3}' | xargs ifconfig | grep inet | grep -v inet6 | awk '{print $2}'

#This is added as net=host does not work for docker for mac which is required to communicate from within the container with another container
#In this case the nginx needs to reverse proxy to different apps
#Ref:-
#https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach 
#https://stackoverflow.com/questions/25170738/how-does-dockers-net-host-setting-work-and-how-can-i-do-something-similar-wi
#https://github.com/docker/for-mac/issues/68
#https://github.com/docker/for-mac/issues/68
ip=$(ipconfig getifaddr en0)

docker run --add-host dockerhost:${ip} -d --name proxy --env TIER=${cmd} -p 80:80 "hyperloop/nginx"

