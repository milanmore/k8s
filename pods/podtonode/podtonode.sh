#Label our nodes with something descriptive
kubectl label node ketanvj2c.mylabserver.com disk=ssd
kubectl label node ketanvj3c.mylabserver.com hardware=gpu


#Query our labels to confirm.
kubectl get node -L disk,hardware

#Create three Pods, two using nodeSelector, one without.
kubectl apply -f podtonode.yaml

#View the scheduling of the pods in the cluster.
kubectl get node -L disk,hardware
kubectl get pods -o wide

#Clean up when we're finished, delete our labels and Pods
kubectl label node ketanvj2c.mylabserver.com disk-
kubectl label node ketanvj3c.mylabserver.com hardware-
kubectl delete pod nginx-pod
kubectl delete pod nginx-pod-gpu
kubectl delete pod nginx-pod-ssd
