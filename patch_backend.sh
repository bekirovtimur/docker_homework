#!/bin/sh
docker cp patch.data $(docker ps | grep "0.0.0.0:8000->3000/tcp" | awk {'print$1'}):/backend/patch.sh
docker exec $(docker ps | grep "0.0.0.0:8000->3000/tcp" | awk {'print$1'}) /bin/sh /backend/patch.sh
