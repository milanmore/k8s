#!/bin/bash

# Create a Pod which uses hostPath as volume type

kubectl create -f hostPath.yaml

# Get into the running container and check the content of 
# folder where hostPath volume is mounted

kubectl exec -it test-pd -- /bin/sh

# Delete the Pod
kubectl delete pod test-pd


