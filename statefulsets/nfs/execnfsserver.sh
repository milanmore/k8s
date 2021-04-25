docker exec -it nfs-server bash -c "echo 'Hello World' > /exports/data-0001/index.html"

# should return the following
ip=$(kubectl get pod www -o yaml |grep podIP | awk '{split($0,a,":"); print a[2]}'); echo $ip


# when data gets updated on nfs server, pod will read new data

docker exec -it nfs-server bash -c "echo 'Hello NFS World' > /exports/data-0001/index.html"

curl $ip
