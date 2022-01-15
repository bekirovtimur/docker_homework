#!/bin/sh
docker build \
  -t frontend_app \
  -f ./frontend/Dockerfile \
  ./frontend

docker run \
  --name frontend \
  -p 80:80 \
  -d \
  frontend_app
