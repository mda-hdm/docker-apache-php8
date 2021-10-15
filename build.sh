#!/bin/sh

name=mdahdm/apache-php8

docker ps -q --filter ancestor="$name:latest" | xargs docker stop
docker ps -a -q --filter ancestor="$name:latest" | xargs docker rm 
docker rmi $name:latest

docker build -t $name .