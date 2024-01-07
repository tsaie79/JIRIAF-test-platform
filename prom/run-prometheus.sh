#!/bin/bash


export HOST_HOME="/home/jeng-yuantsai"


docker run -d \
    --name prometheus \
    --net=host \
    --user "$(id -u)" \
    -v $HOST_HOME/JIRIAF/JIRIAF-test-platform/prom:/prometheus \
    -v $HOST_HOME/JIRIAF/prom-data/data:/prometheus/data \
    prom/prometheus --config.file=/prometheus/prometheus.yml --storage.tsdb.path=/prometheus/data 


      ## Manually open port 9090 in vscode