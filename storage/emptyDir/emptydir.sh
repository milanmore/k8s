#!/bin/bash

# Create the Pod using emptyDir volume type
kubectl create -f emptyDir.yaml

# Now take a shell into running container
kubectl exec -it test-pd -- /bin/sh

# observe that the /cache folder exists
