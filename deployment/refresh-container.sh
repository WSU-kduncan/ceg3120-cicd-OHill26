#!/bin/bash

# Variables
IMAGE_NAME="ohill26/hill-ceg3120:latest"
CONTAINER_NAME="hill-app"
PORT_MAPPING="4200:4200"

echo "Pulling latest image: $IMAGE_NAME..."
sudo docker pull $IMAGE_NAME

echo "Stopping old container (if it exists)..."
sudo docker stop $CONTAINER_NAME 2>/dev/null

echo "kill image"
sudo docker kill $CONTAINER_NAME 2>/dev/null

echo "Removing old container (if it exists)..."
sudo docker rm $CONTAINER_NAME 2>/dev/null

echo "Starting new container..."
sudo docker run -d --name $CONTAINER_NAME -p $PORT_MAPPING $IMAGE_NAME

echo "Container refreshed and running on port 4200"
