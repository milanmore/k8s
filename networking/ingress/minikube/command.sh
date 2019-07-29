#!/bin/bash

# Start minikube
minikube start --vm-driver=none

# check the pods in the kube-system. Ingress controller is not enabled by default
kubectl get pods -n kube-system

# Enable the addon
minikube addons enable ingress

# Now check if ingress-controller pod is also created in the kube-system
# This may take few seconds to start the Pod

# Now create deployment
kubectl create -f echodeploy.yaml

# Now create a service of type ClusterIP (default)
kubectl create -f service.yaml

# Create the Ingress rules 
kubectl create -f ingress.yaml

# Now access the url using curl command on clusterIP
curl http://<ClusterIP>/e2e-test

# You should see Pod information, server values, request information, which part of the index.html of the echo container

# We can check how nginx configures the application routing rules
kubectl exec -it \
-n kube-system <nginx ingress controller Pod Name> \
cat /etc/nginx/nginx.conf
