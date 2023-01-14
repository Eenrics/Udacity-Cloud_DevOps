# Create Docker Volume
docker volume create docker-data

# List Docker Volumes
docker volume ls

# Mount Volume to Container
docker run -d \
  --name devtest \
  --mount source=docker-data,target=/app \
  ubuntu:latest
