#!/bin/bash

echo """
##############################################
#             Anton Deployment               #
#############################################
"""

# Stop on error
set -e

# Reduce likelyhood that someone runs this in production
kubectl config use-context docker-desktop

echo """
###################################
#    Main nginx deployment        #
###################################
"""

export STATIC_CONTENT_PATH=$(pwd)/staticContent/
envsubst < anton-deployment.yaml | kubectl apply -f -
kubectl apply -f nginx-service.yaml

echo """
###################################
#          Admin                  #
###################################
"""
kubectl apply -f users
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
echo "k8s admin token:"
kubectl get secret admin-anton -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
echo ""

echo """
###################################
#    Open URL and start proxy     #
###################################
"""

open "http://localhost:30007/"
kubectl proxy

echo """
To cleanup, run:

kubectl delete deployment anton-deployment
"""
