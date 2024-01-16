#!/bin/bash

# Set your Docker Hub username and the common tag for all images
DOCKER_HUB_USERNAME="kvelusamycs"
TAG="1.0"

# List of services to build and push
services=(
    "turbine-stream-service"
    "gateway"
    "auth-service"
    "monitoring"
    "registry"
    "mongodb"
    "config"
    "notification-service"
    "account-service" 
    "statistics-service"
)

# Function to build, tag, and push Docker image
build_tag_and_push() {
    local service=$1
    local repo_name="piggymetrics-$service" # Prefix with piggymetrics

    echo "Building Docker image for $repo_name..."
    docker build -t $repo_name:$TAG $service

    # Check if docker build was successful
    if [ $? -ne 0 ]; then
        echo "Docker build failed for $repo_name. Exiting."
        return 1
    fi

    echo "Tagging the image for Docker Hub..."
    docker tag $repo_name:$TAG $DOCKER_HUB_USERNAME/$repo_name:$TAG

    echo "Pushing $repo_name:$TAG to Docker Hub..."
    docker push $DOCKER_HUB_USERNAME/$repo_name:$TAG

    # Check if docker push was successful
    if [ $? -ne 0 ]; then
        echo "Docker push failed for $repo_name. Exiting."
        return 1
    fi

    echo "$repo_name image with tag $TAG pushed successfully."
}

# Log in to Docker Hub
echo "Logging into Docker Hub..."
docker login

# Check if login was successful
if [ $? -ne 0 ]; then
    echo "Docker login failed. Exiting."
    exit 1
fi

# Loop through each service and execute build, tag, and push
for service in "${services[@]}"; do
    build_tag_and_push $service || exit 1
done

echo "All images have been built, tagged, and pushed to Docker Hub with tag $TAG."
