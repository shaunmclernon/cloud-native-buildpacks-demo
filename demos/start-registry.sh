#!/usr/bin/env bash

docker stop registry &> /dev/null
docker rm registry &> /dev/null
docker run -d --name registry -p 5000:5000 --restart=always registry:2
