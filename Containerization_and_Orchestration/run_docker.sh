#!/usr/bin/env bash

# Build image
docker build --tag=demolocal .

# List docker images
docker image ls

# Run flask app
docker run -it demolocal bash

# Create Docker Volume
docker volume create docker-data

# List Docker Volumes
docker volume ls

# Mount Volume to Container
docker run -d \
  --name devtest \
  --mount source=docker-data,target=/app \
  ubuntu:latest

# Configure Logging for a Docker Container
# this configuration uses json-file and mode=non-blocking
# The non-blocking mode ensures that the application won't fail in a non-deterministic manner
docker run -it --log-driver json-file --log-opt mode=non-blocking ubuntu

# to see what ports are exposed to the host
docker port <container name>

# actually mapping the ports
docker run -p 127.0.0.1:80:9999/tcp ubuntu bash

# Configuring Memory, CPU and GPU
docker run -it --cpus=".25" --memory="6m" ubuntu /bin/bash
