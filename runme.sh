#!/bin/sh
# Lesson 1
docker build -t frontend_app -f ./1.Dockerfile ./
docker run -d -p 8080:80 --name frontend frontend_app
# Lesson 2
docker build -t backend_app -f ./2.Dockerfile ./
docker run -d -p 5000:5000 --name backend backend_app
