#!/bin/bash

# First create the pods with init containers in it
kubectl create -f podwithinit.yaml

# Now check the pod status 
kubectl get pods

# You will observe that it is showing status as Init:0/2.
# This is because services are not yet created.

# Now descibe the pod and see the status

# Now check each init containers with the following command
kubectl logs myapp-pod -c init-myservice # Inspect the first init container
kubectl logs myapp-pod -c init-mydb      # Inspect the second init container



# Now create the services which init containers are expecting
kubectl create -f services.yaml

# Now you will observe that the init containers have
# completed their task and hence pod is created


# Clean up
kubectl delete service mydb
kubectl delete service myservice
kubectl delete pod myapp-pod
