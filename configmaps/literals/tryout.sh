#!/bin/bash
kubectl create configmap my-config1 --from-file=my-config.txt --from-literal=SERVICE_IP=172.21.12.1 --from-literal=STORE_IP=32.2.1.4
kubectl get configmaps
kubectl describe configmap my-config1
kubectl get configmaps my-config1 -o yaml

# Now create the pod
kubectl create -f podwithenv.yaml

# Now check the environment variables with 
kubectl logs dapi-test-pod

# clean up
kubectl delete cm my-config1
kubectl delete pod dapi-test-pod
