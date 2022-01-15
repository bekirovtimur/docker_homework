#!/bin/sh
docker exec $(docker ps | grep "0.0.0.0:8000->3000/tcp" | awk {'print$1'}) \
  python manage.py migrate
