#!/bin/bash

echo 'Launching mongo cluster...'

docker-compose down

docker-compose up --build -d
if [[ $? -eq 0 ]]; then
    mongosh --host mongo-node1.localhost --port 27017 --eval "rs.status()"
    echo "Done"
else
    echo "Failed to launch the cluster\nExiting"
fi
