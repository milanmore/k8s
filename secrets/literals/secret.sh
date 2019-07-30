#!/bin/bash

# create a secret for mysql password

kubectl create secret generic mysqlpass --from-literal=mysqlpass=abc123

# then to check the secret details

kubectl get secret mysqlpass

# descibe to get more details. Observe that actual password is not reflected anywhere in these details

kubectl describe secret mysqlpass


# Delete secret
kubectl delete secrets mysqlpass
