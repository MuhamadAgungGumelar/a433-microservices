#!/bin/bash

# Perintah untuk membuat Docker image dari Dockerfile
docker build -t shipping-service:latest .

# Mengubah nama image agar sesuai dengan format Docker Hub
docker tag shipping-service:latest rakean55/shipping-service:latest

# Login ke Docker Hub
echo $PASSWORD_DOCKER_HUB | docker login --username rakean55 --password-stdin

# Mengunggah image ke Docker Hub
docker push rakean55/shipping-service:latest

# Login ke Github Container Registry
echo $PASSWORD_GHCR | docker login --username MuhamadAgungGumelar --password-stdin ghcr.io

# Mengubah nama image agar sesuai dengan format Github Container Registry
docker tag shipping-service:latest ghcr.io/muhamadagunggumelar/shipping-service:latest

# Mengunggah image ke Github Container Registry
docker push ghcr.io/muhamadagunggumelar/shipping-service:latest