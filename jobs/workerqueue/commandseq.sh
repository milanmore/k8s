#!/bin/bash

# create a replicaset 
kubectl create -f rsqueue.yaml

# Execute port forward shell script to access the quard from 8083
./portforward.sh

# Create a service to access work queue. So consumers and producer can
# interact with work queue
kubectl create -f svcqueue.yaml

# Generate work queue keygen by executing shell script
./loadqueue.sh

# Now workqueue has 100 SJON objects. Check the status of the queue
curl 127.0.0.1:8083/memq/server/stats

# Now start the consumer job
kubectl create -f jobconsumers.yaml

# observers the pods running
kubectl get pods -w

# clean up the objects created
kubectl delete rs,svc,job -l example=jobs
