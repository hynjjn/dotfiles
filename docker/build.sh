#!/bin/bash

# Define the image name base
IMAGE_NAME="my-app"

# Loop through all files starting with Dockerfile.
for df in Dockerfile.*; do
    # Extract the extension (e.g., 'arch' from 'Dockerfile.arch')
    TAG="${df#*.}"
    
    echo "------------------------------------------------"
    echo "Building $IMAGE_NAME:$TAG using $df..."
    echo "------------------------------------------------"

    # Build the image
    # -f specifies the filename, -t sets the name:tag
    docker build -f "$df" -t "${IMAGE_NAME}:${TAG}" .

    # Check if the build was successful
    if [ $? -eq 0 ]; then
        echo "Successfully built ${IMAGE_NAME}:${TAG}"
    else
        echo "Failed to build ${IMAGE_NAME}:${TAG}"
        exit 1
    fi
done

echo "------------------------------------------------"
echo "All builds complete!"
docker images | grep "$IMAGE_NAME"
