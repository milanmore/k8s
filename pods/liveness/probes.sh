#Start a watch to see the events associated with our probes.
kubectl get events --watch &

#We have a single container pod app, in a Deployment that has both a liveness probe and a readiness probe
#Send in our deployment, after 10 seconds, our liveness and readiness probes will fail.
#The liveness probe will kill the current pod, and recreate one.
kubectl apply -f deployment-probes.yaml

#kill our watch
fg
ctrl+c

#We can see that our container isn't ready 0/1 and it's Restarts are increasing.
kubectl get pods

#Let's figure out what's wrong
#1. We can see in the events. The Liveness and Readiness probe failures.
#2. Under Containers, Liveness and Readiness, we can see the current configuration. And the current probe configuration. Both are pointing to 8081.
#3. Under Containers, Ready and Container Contidtions, we can see that the container isn't ready.
#3. Our Container Port is 8080, that's what we want our probes, probings. 
kubectl describe pods

#So let's go ahead and change the probes to 8080
#And send that change into the API Server for this deployment.
kubectl apply -f deployment-probes.yaml

#Confirm our probes are pointing to the correct container port now, which is 8080.
 
#Let's check our status, a couple of things happened there.
#1. Our Deployment ReplicaSet created a NEW Pod, when we pushed in the new deployment configuration.
#2. It's not immediately ready because of our initialDelaySeconds which is 10 seconds.
kubectl get pods 

kubectl delete deployment hello-world
