#!/bin/bash

# Create a namespace mem-cpu

kubectl create -f nsquota.yaml

# Create resource quota 

kubectl create -f quotas.yaml

# Get the details about the resource quotas

kubectl get resourcequota mem-cpu-demo --namespace=mem-cpu --output=yaml

# creat a pod mentioning resource quota

kubectl create -f podmemcpu.yaml

# Check if the pod gets created. It will as resources are within the limits

kubectl get pod quota-mem-cpu-demo -n mem-cpu

# Now check the available quota after creating the pod

kubectl get resourcequota mem-cpu-demo --namespace=mem-cpu --output=yaml

# Now create another pod which demands more resources 

kubectl create -f podmemcpu2.yaml

# This should fail as quotas exceeds what is available in namespace

# Now create a pod which is not specifying resource limits.
# This pod will also not be created as it is a must to specify mem and cpu limits inside a ns which has limits

kubectl create -f podmemcpu3.yaml

# Now delete the resources created

kubectl delete ns mem-cpu 






