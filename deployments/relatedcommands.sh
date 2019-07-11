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
echo 'Now scale the deployment using ...'
echo 'kubectl scale deploy nginxdep --replicas=3'
read
kubectl scale deploy nginxdep --replicas=3

read
echo ''
echo 'Now check the deployment, replicaset and pod after scaling'
echo 'kubectl get deploy,rs,po -l app=nginxdep'
read
kubectl get deploy,rs,po -l app=nginxdep


read
echo ''
echo 'Now get details about the deployment using ...'
echo 'kubectl describe deploy nginxdep'
read
kubectl describe deploy nginxdep

read
echo ''
echo 'Now scale the deployment again using ...'
echo 'kubectl scale deploy nginxdep --replicas=2'
read
kubectl scale deploy nginxdep --replicas=2

read
echo ''
echo 'Now get details about the rollout history ...'
echo 'kubectl rollout history deploy nginxdep'
read
kubectl rollout history deploy nginxdep

read
echo ''
echo 'Now get details about a specific revision 1...'
echo 'kubectl rollout history deploy nginxdep --revision=1'
read
kubectl rollout history deploy nginxdep --revision=1
read

echo 'Now get details about a specific revision 2...'
echo 'kubectl rollout history deploy nginxdep --revision=2'
read
kubectl rollout history deploy nginxdep --revision=2


read
echo ''
echo 'delete the deployment using ...'
echo 'kubectl delete deployment nginxdep'
read
kubectl delete deployment nginxdep
