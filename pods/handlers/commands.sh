#!/bin/bash

# Create the Pod
kubectl create -f handlers.yaml

# Verify the pod is created
kubectl get pod lifecycle-demo

# Get a shell inside the container running in your pod
kubectl exec -it lifecycle-demo -- /bin/bash


# Check if postStart handler has creted the message file
cat /usr/share/message

# should display "Hello from the postSrtart handler"

# Exit from the container
exit

# delete the pod
kubectl delete pod lifecycle-demo


