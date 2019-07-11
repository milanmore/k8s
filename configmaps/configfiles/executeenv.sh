#!/bin/bash
# Now execute a shell inside the container and check env command 
# env | grep LOG
kubectl exec -it pod-env-config /bin/sh
