#!/bin/bash

while true; do
    kubectl get pods -o wide
    echo ---
    kubectl top node
    echo ---
    kubectl top pods
    sleep 3
done
