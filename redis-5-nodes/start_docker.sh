#!/bin/bash

docker-compose down
docker-compose build
docker network prune
docker-compose up
