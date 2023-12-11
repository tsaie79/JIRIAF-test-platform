#!/bin/bash

docker run -d --net=host --user "$(id -u)"\
 --volume "/home/tsai/JIRIAF/prom-data/grafana-data:/var/lib/grafana"\
  grafana/grafana-enterprise

  ## Manually open port 3000 in vscode