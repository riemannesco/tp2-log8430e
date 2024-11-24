#!/bin/bash

docker-compose down -v

MONGO_INIT=$(cat mongo-init.js)

echo 'Launching mongo cluster...'
docker-compose up --build -d
if [[ $? -eq 0 ]]; then
    sleep 1
    docker exec -it mongo1 mongosh --eval "$MONGO_INIT"
    sleep 1
    docker exec mongo1 mongosh --eval "rs.status()"
    echo "Done"
else
    echo "Failed to launch the cluster\nExiting"
fi
