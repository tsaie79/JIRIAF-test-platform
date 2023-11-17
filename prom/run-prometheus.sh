#!/bin/bash

docker run -d \
    --net=host \
    --user "$(id -u)" \
    -v /workspaces/JIRIAF-test-platform/prom:/prometheus \
    -v /home/vscode/.prom-data/data:/prometheus/data \
    prom/prometheus --config.file=/prometheus/prometheus.yml --storage.tsdb.path=/prometheus/data 


      ## Manually open port 9090 in vscode