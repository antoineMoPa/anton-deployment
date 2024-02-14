#!/bin/bash

set -e

export STATIC_CONTENT_PATH=/Users/lumen5/lumen5/antonk8s/staticContent/

envsubst < anton-deployment.yaml | kubectl apply -f -
kubectl apply -f nginx-service.yaml
kubectl apply -f users

echo "k8s admin token:"
kubectl get secret admin-anton -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
echo ""

open "http://localhost:30007/"
