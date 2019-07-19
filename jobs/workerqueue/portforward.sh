#!/bin/bash

QUEUE_POD=$(kubectl get pods -l app=work-queue,component=queue \
  -o jsonpath='{.items[0].metadata.name}')
kubectl port-forward $QUEUE_POD 8083:8080
