#!/bin/bash
# create the pod and then check the container to check file mounts with variables
# Once inside the container, go to /etc/config folder and do ls -l
# you can also check the content with cat log.level and cat log.location to see the output
kubectl exec -it pod-vol-conf /bin/sh
