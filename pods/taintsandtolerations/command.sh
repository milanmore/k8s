#!/bin/bash

# Taint One Node
kubectl taint node ketanvj2c.mylabserver.com node-type=prod:NoSchedule

# Obesrve that taint got registered with the node
kubectl describe node ketanvj2c.mylabserver.com | grep Taint

# Create the Pod without tolerations
# Observe that it gets scheduled to non tainted node only
kubectl create -f devpod.yaml


# Now create a pod which has a toleration for the tainted nodes
kubectl create -f prodpod.yaml

# Observe that it gets scheduled to tainted node-prod Node

# Clear the environment by deleting pod and deployment
kubectl delete pod dev-pod
kubectl delete deploy prod


