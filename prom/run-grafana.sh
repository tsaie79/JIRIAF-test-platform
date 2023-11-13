#!/bin/bash

docker run -d --net=host --user "$(id -u)"\
 --volume "/workspaces/JIRIAF-test-platform/prom/grafana-data:/var/lib/grafana"\
  grafana/grafana-enterprise