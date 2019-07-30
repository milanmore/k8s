#!/bin/bash

# This exercise assumes a working Kubernetes cluster running on a public cloud
# platform (e.g. AWS, GCP, Azure), comprising of at least two 'worker' nodes.

# EXPOSING A WORKLOAD USING THE SERVICE API

RED='\033[0;31m'
NC='\033[0m' # No Color
GR='\033[0;32m'

# 1. Deploy the workload to your cluster.
echo 'Create the deployment using custnginx.yaml'
echo -e "${GR}kubectl apply -f ./nginxdep.yaml${NC}"
echo 'Press ENTER to execute above command'
read
kubectl apply -f ./nginxdep.yaml
echo

# 2. Check that the pods are up and running, and make a note of which nodes the
#    pods have been scheduled to.
read
echo 'get pod details'
echo -e "${GR}kubectl get po -o wide | grep custnginx${NC}"
echo 'Press ENTER to execute above command'
read
kubectl get po -o wide | grep custnginx
echo

# 3. Expose the deployment via a Service object.
read
echo 'create a service - ClusterIP'
echo -e "${GR}kubectl expose deployment custnginx --port 8082 --target-port 80${NC}"
echo 'Press ENTER to execute above command'
read
kubectl expose deployment custnginx --port 8082 --target-port 80
echo

# 4. Inspect the created Service object, and make a note of the clusterIP.
read
echo 'get the service details and note cluster IP'
echo -e "${GR}kubectl get svc custnginx -o yaml${NC}"
echo 'Press ENTER to execute above command'
read
kubectl get svc custnginx -o yaml
echo

# 5. Check that the service can be consumed from within the cluster, by curling
#    the clusterIP:port
read
echo "Enter the ClusterIP below"
read clusterIP
echo 'create a temporary container and run curl command to request service from clusterIP:8082'
echo -e "${GR}kubectl run -it --rm curl --restart=Never \\ ${NC}"
echo -e   "${GR}--image=appropriate/curl -- $clusterIP:8082${NC}"
echo 'Press ENTER to execute above command'
read
kubectl run -it --rm curl --restart=Never \
    --image=appropriate/curl -- $clusterIP:8082
echo

# 6. Check that the service can be consumed using the custnginx service name.
read
echo 'verify that service is accessible via service name internally without using IP address'
echo -e "${GR}kubectl run -it --rm curl --restart=Never \\"
echo -e "    --image=appropriate/curl -- custnginx:8082${NC}"
echo 'Press ENTER to execute above command'
read
kubectl run -it --rm curl --restart=Never \
    --image=appropriate/curl -- custnginx:8082
echo

# 7. Edit the custnginx service, and change the type from ClusterIP to NodePort.
read
echo 'Edit the service and change the type to NodePort nodeport as 30082'
echo -e "${GR}kubectl edit svc custnginx${NC}"
echo 'Press ENTER to execute above command'
read
kubectl edit svc custnginx
echo

# 8. Inspect the updated Service object, and make a note of the nodePort.
read
echo ''
echo -e "${GR}kubectl get svc custnginx -o yaml${NC}"
echo 'Press ENTER to execute above command'
read
kubectl get svc custnginx -o yaml
echo

# 9. Using each node's external IP address, and the nodePort, use a web browser
#    to navigate to the exposed service.
echo 'DO NOT PRESS ENTER NOW. Once you check the service in the browser then you press enter'
echo 'Enter will delete the service and deployment both'
read
echo "are you sure you want to delete the service and deployment? Then press enter once more"
read
kubectl delete service custnginx
echo
kubectl delete deploy custnginx
# 10. If you have enabled the LoadBalancer service of you cloud provider.
#     then you can Edit the nginx service, and change the type from NodePort to
#    LoadBalancer.

# kubectl edit svc nginxhello (change type to LoadBalancer)

# 11. Inspect the updated Service object, and make a note of the hostname or IP
#     address of the provisioned load balancer. You may  have to wait for this to
#     be provisioned.

# kubectl get svc nginxhello -o yaml

# 12. Using the hostname or IP address of the load balancer, use a web browser to
#     navigate to the service.
