

kubectl apply -f nginxdep.yaml

kubectl get pods -l run=my-nginx -o wide

kubectl get pods -l run=my-nginx -o yaml | grep podIP:


kubectl expose deployment/my-nginx

kubectl run curl --image=radial/busyboxplus:curl -i --tty

nslookup my-nginx
