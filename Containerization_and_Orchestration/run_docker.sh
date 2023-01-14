#!/usr/bin/env bash

# Build image
docker build --tag=demolocal .

# List docker images
docker image ls

# Run flask app
docker run -it demolocal bash

# Or by specifying the ports 
docker run -p 8000:5001 demolocal

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

# To build your container, if tagging your container as my-python-app
docker build -t my-python-app .

# To run the container, given my-python-app as the image tag and my-running-app as the container name
docker run -it --rm --name my-running-app my-python-app

# Launch Containers in a Kubernetes Cluster
docker stack deploy --namespace my-app --compose-file /path/to/docker-compose.yml mystack
