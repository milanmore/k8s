#Create Pod
kubectl create -f examples.yaml

#Check labels for all the pods in the default namespace 
kubectl get pods --show-labels

#View the labels for a particular pod 
kubectl get pods label-demo --show-labels
 kubectl describe pods label-demo
 
#Query for a specific label
kubectl get pods -l app=nginx

#Print label on  command output
kubectl get pods -L app,tier 

#Edit an existing label
kubectl label pod label-demo tier=frontend --overwrite
kubectl get pod label-demo --show-labels

#Adding a new label
kubectl label pod label-demo db=mysql
kubectl get pod label-demo --show-labels

#Removing an existing label
kubectl label pod label-demo db-
kubectl get pod label-demo --show-labels

#Performing an operation on a collection of pods based on a label query
# Careful this will act on all the pods in your default namespace!!!!
kubectl label pod --all tier=backend --overwrite
kubectl get pod --show-labels

#Delete all pods matching our label
kubectl delete pod -l tier=abc
