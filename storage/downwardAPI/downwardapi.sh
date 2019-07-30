#!/bin/bash

# Create a Pod which accesses Pod values from inside the container

kubectl create -f pod.yaml

# Get into the running container and check the content of 
# folder /etc/podinfo

 kubectl exec -it kubernetes-downwardapi-volume-example -- /bin/sh

# Also container continuously outputs the content of label and annotations file
# which you can observe using kubectl logs command
kubectl logs kubernetes-downwardapi-volume-example

# Delete the Pod
kubectl delete pod kubernetes-downwardapi-volume-example

# Now create a Pod which accesses container values
kubectl create -f podcontainerfield.yaml

# Get into running container
 kubectl exec -it kubernetes-downwardapi-volume-example-2 -- sh

# Check the folder /etc/podinfo where you will find 4 files,
# verify the content of the file matches with the resource 
# limits for a container

# Delete the pod
 kubectl delete pod kubernetes-downwardapi-volume-example-2


