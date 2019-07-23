#!/bin/bash

# Create the job
kubectl create -f parallel.yaml

# Job will take some time to execute
# Check the status of pods in watch mode and see pods coming up
# and executing their tasks
kubectl get pods --watch

# Delete the job
kubectl delete job parallel
