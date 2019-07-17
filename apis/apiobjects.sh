# Objective:
# Understand what is context/namespace
# get cluster information
# Getting api resource objects
# Getting Manifest content guidelines
# Creating Pod, verifying pod got created and deleting it

#Get information about our current context, ensure we're logged into the correct cluster.
kubectl config get-contexts

#Change our context if needed. You need to create context which we will see in future sessions
kubectl config use-context kubernetes-admin@kubernetes

#Get information about our current context, 
kubectl cluster-info

#Get a list of API Resources available in the cluster. Observe fields, specially apigroups and kind
kubectl api-resources | more

#List of objects available in a specific api group
kubectl api-resources --api-group=apps

#Using kubectl explain, this provides all the possible configuration one can do in pod manifest.
#This is very good way have information handy without going to google
kubectl explain pods | more

#Creating a pod by executing create command
kubectl create -f pod.yaml

#What we need in pod.spec and pod.spec.containers
kubectl explain pod.spec | more
kubectl explain pod.spec.containers | more

#Detail info in a specific version
kubectl explain deployment --api-version apps/v1beta2
kubectl explain deployment --api-version apps/v1

# Supported API versions
kubectl api-versions

#Get a list of our currently running pods
kubectl get pod 

#Remove our pod
kubectl delete pod hello-world

