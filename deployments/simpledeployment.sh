#!/bin/bash
echo 'create a simple deployment from command line using ...'
echo 'kubectl create deployment nginxdep --image=nginx'
read
kubectl create deployment nginxdep --image=nginx
read
echo ''
echo 'Now check the deployment, replicaset and pod created using ...'
echo 'kubectl get deploy,rs,po -l app=nginxdep'
read
kubectl get deploy,rs,po -l app=nginxdep

read
echo ''
echo 'delete the deployment using ...'
echo 'kubectl delete deployment nginxdep'
read
kubectl delete deployment nginxdep
