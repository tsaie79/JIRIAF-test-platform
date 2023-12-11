#!/bin/bash

docker run -d \
    --net=host \
    --user "$(id -u)" \
    -v /home/tsai/JIRIAF/JIRIAF-test-platform/prom:/prometheus \
    -v /home/tsai/JIRIAF/prom-data/data:/prometheus/data \
    prom/prometheus --config.file=/prometheus/prometheus.yml --storage.tsdb.path=/prometheus/data 


      ## Manually open port 9090 in vscode