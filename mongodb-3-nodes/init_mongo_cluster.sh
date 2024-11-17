#!/bin/bash

echo 'Launching mongo cluster...'

docker-compose down

docker-compose up --build -d
if [[ $? -eq 0 ]]; then
    sleep 1
    docker exec mongo1 mongosh --eval "rs.status()"
    echo "Done"
else
    echo "Failed to launch the cluster\nExiting"
fi
