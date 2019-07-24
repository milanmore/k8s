#!/bin/bash

# Create namespace memory-demo if not already created
kubectl create -f mem-examplens.yaml

# Create Pod in the same namespace
# The args section in the configuration file provides arguments for the Container when it starts. The "--vm-bytes", "250M" arguments tell the Container to attempt to allocate 250 MiB of memory.This is beyond the quota allocated to pod

kubectl create -f exceedmemlimitpod.yaml -n mem-example

# Check the Pod details with the following command
# you should see the resource limits as per Pod definition
kubectl get pod memory-demo-2 -o yaml -n mem-example

# Check Pod status it it got created. You will see the status as OOMKilled
# as there is no sufficient quota available for pod to be created.
kubectl get pod memory-demo-2 -n mem-example

# Delete the pod and namespace
kubectl delete pod memory-demo-2 --namespace=mem-example
kubectl delete ns mem-example
