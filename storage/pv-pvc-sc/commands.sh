#!/bin/bash

# Create a Storage Class with local storage.
kubectl create -f sc.yaml

# Observe the parameters using describe command
# Observe ReclaimPolicy and VolumeBindingMode parameter
kubectl describe sc loca-sc

# Create Persistent Volume referring to storage class local-sc
kubectl create -f pv.yaml

# Check the status of the PV is available, with policy retain
kubectl get pv pvpvcsc

# Create Persistent Volume Claim referring to local-storage
kubectl create -f pvc.yaml

# Check the status of pv and pvc both
kubectl get pv pvpvcsc
kubectl get pvc pvpvcsc

# PV is still in the same state of available. Bounding has not happend
# PVC is in Pending status. To get the reason. Do a detail view on PVC
kubectl describe pvc pvpvcsc

# see the event section and it is waiting for first consumer to be created. 
# Now create a Pod which will claim this pvc which in tern will get
# bound to pv we created.
kubectl create -f pod.yaml

# Now check the pvc again and it will not show that Pod pvpvcsc has mounted this claim
kubectl describe pvc pvpvcsc

# Now check the PV status and it will show bound to claim default/pvpvcsc
kubectl get pv pvpvcsc

# Now create another pod mounting the same pvc
kubectl create -f pod1.yaml

# Check that pvc describe command now shows that it is mounted on two pods
kubectl describe pvc pvpvcsc

# Now there are few extra pv, pvc, and pod files are provided 
# Try working with them and see the status


# At the end delete all the objects

kubectl delete sc local-sc
kubectl delete pod pvpvcsc
kubectl delete pvc pvpvcsc
kubectl delete pv pvpvcsc











