# Understand Services
# Create a deployment and a service
kubectl create -f service.yaml

# Now check the service details. Observe that ClusterIP is assigned with Service Port details.
kubectl get svc simple-service

# Get more details about the service. Observe the TargetPort details is as per configuration
# And There are no Endpoints
kubectl describe svc simple-service

# Now create a deployment and a service
kubectl create -f deploy.yaml

# Check the Pod which got created and get its ipddress
kubectl get pods -l app=ss

# Try accessing one of the service running inside the container of POD by
curl http://<PodIP>:9876/endpoint0
# Above command should give you optput similar to below
{"host": "10.244.2.211:9876", "version": "0.4.0", "result": "all is well"}
# IP address above will be your Pod IP address. 

# You can try above curl command from any node in the cluster

# Check the service details and observe that one endpoint is added in the deployment.
# Assuming deployment configuratin had asked for only one replica.
kubectl describe svc simple-service

# For each Service in Kubernetes, Kubernetes creates an endpoint object
# Name of the endpoint object is same as service name. Observe the details.
kubectl get ep simple-service

# Now check the IPtables of linux to see that Kube-proxy has added IPtable rules
# corresponding to this service.
sudo iptables-save | grep simple-service

# Now modify the deployment and add 2 more replicas
kubectl apply -f deploy.yaml
# alternatively you can modify the deployment on the fly by
kubectl edit deployment simple-svc

# Now check that one endpoint is added for each of the Pods
kubectl describe svc simple-service

# Now you can add a Pod separately having the same label as the 
# label selector used in the service.
kubectl create -f pod.yaml

# Now check that one more endpoint got added in the service.
kubectl describe ep simple-service

# Clean up the objects created for this lab.
kubectl delete deploy,svc,pods -l app=ss

