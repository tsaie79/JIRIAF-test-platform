#!/bin/bash

docker run -d --net=host --user "$(id -u)"\
 --volume "/home/vscode/.prom-data/grafana-data:/var/lib/grafana"\
  grafana/grafana-enterprise