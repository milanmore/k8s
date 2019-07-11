#!/bin/bash

# Create secret by referring to the file created

kubectl create secret generic secretfromfile --from-file=mysqlpass.txt
