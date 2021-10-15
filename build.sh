#!/bin/sh

name=mdahdm/apache-php8

docker ps -q --filter ancestor="$name:latest" | xargs docker stop
docker ps -a -q --filter ancestor="$name:latest" | xargs docker rm 
docker rmi $name:latest

docker build -t $name .
docker run -d -p 8000:80 --name apache-php8 $name:latest