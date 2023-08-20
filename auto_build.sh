#!/bin/bash

# Set image names
CLIENT_IMAGE_NAME="client/Dockerfile.client"
SERVER_IMAGE_NAME="client/Dockerfile.server"
VERSION="latest"  # or specify your version, e.g., "v1.0"

# Navigate to the root directory of your project
cd "$(dirname "$0")"

# Build the client image
echo "Building client Docker image..."
docker build -t "$CLIENT_IMAGE_NAME:$VERSION" -f client/Dockerfile .

# Check if the client image was built successfully
if [ $? -ne 0 ]; then
    echo "Error building client Docker image."
    exit 1
fi

# Build the server image
echo "Building server Docker image..."
docker build -t "$SERVER_IMAGE_NAME:$VERSION" -f server/Dockerfile .

# Check if the server image was built successfully
if [ $? -ne 0 ]; then
    echo "Error building server Docker image."
    exit 1
fi

echo "Successfully built both client and server Docker images."

