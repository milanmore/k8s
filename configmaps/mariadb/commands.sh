#!/bin/bash

# Convert password to Base64 encoded format
echo -n 'Passw0rd' | base64

# Note the encoded string. Create yaml file for secret
kubectl create -f mariasecret.yaml

# Verify the newly created secret.Specially note the Data field which does not display the value
# But just shows the size 
kubectl describe secret mariadb-root-password

# One can decode the secret using 
kubectl get secret mariadb-root-password -o jsonpath='{.data.password}' | base64 --decode -

# Scret can also be created from command line
kubectl create secret generic mariadb-user-creds \
      --from-literal=MYSQL_USER=mariauser\
      --from-literal=MYSQL_PASSWORD=Passw0rd

# Verify the secrets
kubectl get secret mariadb-user-creds -o jsonpath='{.data.MYSQL_USER}' | base64 --decode -
kubectl get secret mariadb-user-creds -o jsonpath='{.data.MYSQL_PASSWORD}' | base64 --decode -

# Create a file max_allowed_packet.cnf and create configmap
kubectl create configmap mariadb-config --from-file=max_allowed_packet.cnf

# Just like Secrets, ConfigMaps store one or more key/value pairs in their Data hash of the object. By default, using --from-file=<filename> (as above) will store the contents of the file as the value, and the name of the file will be stored as the key

# Verify the content of configmap
 kubectl get configmap mariadb-config

# Observer how these secrets and configmaps are used within the deployment.
# Now create the deployment
kubectl create -f mariadep.yaml

# Verify the pod is created
kubectl get pods

# Verify the instance is using secrets and configmap.You should see all 3 environment variables
kubectl exec -it <Enter Your Pod Name Here> env |grep MYSQL

# Check if max_allowed_packet.cnf file was created
kubectl exec -it <Your Pod Name> ls /etc/mysql/conf.d

# Check file content
kubectl exec -it <Your Pod Name> cat /etc/mysql/conf.d/max_allowed_packet.cnf

# Now get a shell inside the container and run mysql commands
kubectl exec -it mariadb-deployment-5465c6655c-7jfqm /bin/sh

# Now execute the following command to list the databases
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e 'show databases;'

# Check that the max_allowed_packet.cnf was parsed
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "SHOW VARIABLES LIKE 'max_allowed_packet';"

# Clean up
exit
kubectl delete deploy mariadb-deployment
kubectl delete secret mariadb-root-password mariadb-user-creds
kubectl delete cm mariadb-config

















