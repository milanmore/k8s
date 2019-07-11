#!/bin/bash

# Create base64 encoded password
echo mysqlpass | base64

# NOw copy this output to your yaml file for creating Secret
