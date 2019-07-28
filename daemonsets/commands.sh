#!/bin/bash

# Observe the DaemonSet config file for fluentd
# Create the DaemonSet 
kubectl create -f fluentd.yaml

# Check whether it got created
kubectl get ds -n kube-system

# Observe the details by using describe command
kubectl describe ds fluentd -n kube-system

# Check the pods created by daemonset
kubectl get pods -o wide -n kube-system

# Now delete one of the pods and DaemonSet will create a new pod in the same node
kubectl delete pod <Pod Name> -n kube-system 
kubectl get pods -o wide -n kube-system

# Delete the fluentd daemonset
kubectl delete ds fluentd -m kube-system

# Now execute the nginx DaemonSet
kubectl create -f nginx-ssd.yaml

# Check the output, no pods will be created 
# as we have not added labels to the node
kubectl get pods -o wide

# Now add a lable to one of the nodes
kubectl label nodes ketanvj2c.mylabserver.com ssd=true


# Verify that the label got created 
kubectl get nodes --selector ssd==true

# Now you will see that DaemonSet created a pod on that node
kubectl get pods -o wide

# Now add the label on the second node and check whether one more Pod got created
kubectl label nodes ketanvj2c.mylabserver.com ssd=true

# Now delete the label from one of the nodes
kubectl label node ketanvj2c.mylabserver.com ssd-

# Observe that DaemonSet controller have deleted the Pod from the node  

# Delete the DaemonSet
kubectl delete ds nginx-fast-storage

# Delete the label
kubectl label node ketanvj3c.mylabserver.com ssd-




 


