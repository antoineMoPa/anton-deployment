#!/bin/bash

set -e

kubectl apply -f .
kubectl apply -f users


echo "k8s admin token:"
kubectl get secret admin-anton -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d
echo ""


echo "see dashboard at"
echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login"
