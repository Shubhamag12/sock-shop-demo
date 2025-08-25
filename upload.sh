#!/bin/bash

# Simple script to pull Docker images and load them into Kind cluster

# List of images to pull and load
IMAGES=(
    "quay.io/powercloud/sock-shop-carts:latest"
    "icr.io/ppc64le-oss/mongodb-ppc64le:4.4.24"
    "quay.io/powercloud/sock-shop-catalogue:latest"
    "quay.io/powercloud/sock-shop-front-end:latest"
    "quay.io/powercloud/sock-shop-orders:latest"
    "icr.io/ppc64le-oss/mongodb-ppc64le:4.4.24"
    "quay.io/powercloud/sock-shop-payment:latest"
    "quay.io/powercloud/sock-shop-queue-master:latest"
    "quay.io/powercloud/rabbitmq:latest"
    "icr.io/ppc64le-oss/rabbitmq-exporter-ppc64le:1.0.0-RC19"
    "quay.io/powercloud/sock-shop-shipping:latest"
    "quay.io/powercloud/sock-shop-user:latest"
    "quay.io/powercloud/sock-shop-user-db:ppc64le"
    ""
)

# Kind cluster name (change if needed)
CLUSTER_NAME="kind"
echo "Pulling and loading images into Kind cluster: $CLUSTER_NAME"
echo

for image in "${IMAGES[@]}"; do
    echo "Processing: $image"
    
    # Pull the image
    docker pull "$image"
    
    # Load into Kind cluster
    kind load docker-image "$image" --name "$CLUSTER_NAME"
    
    echo "✓ Completed: $image"
    echo
done

echo "All images loaded successfully!"