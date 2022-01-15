#!/bin/sh
docker network create backend-net

docker run \
  --name database \
  --network=backend-net \
  -p 5432:5432 \
  -e POSTGRES_USER=django \
  -e POSTGRES_PASSWORD=django \
  -e POSTGRES_DB=django \
  -e PGDATA=/var/lib/postgresql/data/pgdata \
  -d \
  -v /database:/var/lib/postgresql/data \
  postgres:14

docker build \
  -t backend_app \
  -f ./lib_catalog/Dockerfile \
  ./lib_catalog

docker run \
  --name backend \
  --network=backend-net \
  -p 8000:3000 \
  -d \
  -it \
  backend_app
