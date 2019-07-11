#!/bin/bash
echo 'create a simple deployment from command line using and scale it to 3'
echo 'kubectl create deployment nginxdep --image=nginx'
read
kubectl create deployment nginxdep --image=nginx
kubectl get deploy,rs,po -l app=nginxdep
kubectl scale deploy nginxdep --replicas=3
kubectl get deploy,rs,po -l app=nginxdep
kubectl rollout history deploy nginxdep --revision=1

read
echo ''
echo 'Now upgrade the deployment using ...'
echo 'kubectl set image deployment nginxdep nginx=ngixn:alpine'
read
kubectl set image deployment nginxdep nginx=ngixn:alpine

read
echo ''
echo 'Now get details about the rollout history and you should see two revisions now ...'
echo 'kubectl rollout history deploy nginxdep'
read
kubectl rollout history deploy nginxdep

read
echo ''
echo 'Now get details about a specific revision 1 and check the nginx image ...'
echo 'kubectl rollout history deploy nginxdep --revision=1'
read
kubectl rollout history deploy nginxdep --revision=1
read

echo 'Now get details about a specific revision 2 and check the nginx image ...'
echo 'kubectl rollout history deploy nginxdep --revision=2'
read
kubectl rollout history deploy nginxdep --revision=2

read
echo ''
echo 'Now check the details about the deployment, replicaset and pod  ...'
echo 'kubectl get deploy,rs,po -l app=nginxdep'
read
kubectl get deploy,rs,po -l app=nginxdep
echo 'Observer that there are now two replicasets and deployment and pods names are same'
echo 'One is original state and one is current state. One can anytime rollback to previous state'

read
echo ''
echo 'Now rollback to revision 1 ...'
echo 'kubectl rollout undo deploy nginxdep --to-revision=1'
read
kubectl rollout undo deploy nginxdep --to-revision=1

read
echo ''
echo 'Now get details about the rollout history and you should see two revisions 2 & 3 ...'
echo 'Revision 1 now becomes revision 3 ...'
echo 'kubectl rollout history deploy nginxdep'
read
kubectl rollout history deploy nginxdep

read
echo ''
echo 'Now get details about a revision 3 and check the nginx image ...'
echo 'kubectl rollout history deploy nginxdep --revision=3'
read
kubectl rollout history deploy nginxdep --revision=3

read
echo ''
echo 'Now check the details about the deployment, replicaset and pod  ...'
echo 'kubectl get deploy,rs,po -l app=nginxdep'
read
kubectl get deploy,rs,po -l app=nginxdep
echo 'Observer that there are now first replicaset  has become active and deployment and pods names are same'
echo 'One can have maximum 10 consecutive rolling updates and rollback '

read
echo ''
echo 'delete the deployment using ...'
echo 'kubectl delete deployment nginxdep'
read
kubectl delete deployment nginxdep
