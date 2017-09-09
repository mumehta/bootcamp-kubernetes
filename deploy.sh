#!/bin/bash

VERSION=$(git log --pretty=format:'%h' -n 1)

# Authenticate against our Docker registry
eval $(aws ecr get-login --region=ap-southeast-2)

# Build and push the image
docker build -t bootcamp/node-api:$VERSION .
docker tag bootcamp/node-api:$VERSION 191618872039.dkr.ecr.ap-southeast-2.amazonaws.com/bootcamp/node-api:$VERSION
docker push 191618872039.dkr.ecr.ap-southeast-2.amazonaws.com/bootcamp/node-api:$VERSION

#Deploy, Rolling update to cluster
kubectl --kubeconfig=cluster/kubeconfig set image deployment/node-api node-api=191618872039.dkr.ecr.ap-southeast-2.amazonaws.com/bootcamp/node-api:$VERSION
