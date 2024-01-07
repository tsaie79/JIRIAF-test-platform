#!/bin/bash

export HOST_HOME="/home/jeng-yuantsai"

docker run -d --net=host --user "$(id -u)"\
 --name=grafana\
 --volume $HOST_HOME/JIRIAF/prom-data/grafana-data:/var/lib/grafana\
  grafana/grafana-enterprise

  ## Manually open port 3000 in vscode