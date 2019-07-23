#!/bin/bash

# Create a namespace quota-pod-example
kubectl create -f nsquota.yaml

# Create ResourceQuota with Pod limits
kubectl create -f podquota.yaml -n quota-pod-example

# Create the deployment with 3 replicas
kubectl create -f quotadep.yaml

# Since the podquota is set to 2, it will only create 2 pods
kubectl get deployment pod-quota-demo -n quota-pod-example -o yaml

# Delete namespace, deployment, and pod
kubectl delete deploy,resourcequota --all -n quota-pod-example
kubectl delete ns quota-pod-example
