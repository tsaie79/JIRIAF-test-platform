#!/bin/bash

while true; do
    echo "=========="
    kubectl top node
    # echo ---
    # kubectl -n ersap-1 get pods -o wide
    # echo ****
    # kubectl -n ersap-2 get pods -o wide
    echo "---"
    kubectl top pods
    # echo "---"
    # kubectl -n "2" top pods
    sleep 3
done



# check the ports 2776, 2321, 46859, 10250 with lsof 
for port in 1776 12345 2221 46859 10250; do
    lsof -i :$port
done
