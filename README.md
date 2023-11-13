# Test JIRIAF by using vk-cmd and J-process-exporter
This main purpose of this project is to test JIRIAF by using [vk-cmd](https://github.com/tsaie79/vk-cmd.git) and [J-process-exporter](https://github.com/tsaie79/J-proc-exporter.git). Those two projects build docker images. For source codes of those two projects, please refer to their own repositories.

# Used branches for testing

| Test platform | vk-cmd        | J-process-exporter |
| :------------ | :------------ | :----------------- |
| main          | custom-config | main               |
| test-ersap-wf | custom-config | main               |


# Used Docker images for testing
| Test platform | vk-cmd           | J-process-exporter    |
| :------------ | :--------------- | :-------------------- |
| main          | vk-cmd:v20231113 | process-exporter:v1.0.0 |
| test-ersap-wf | vk-cmd:v20231113 | process-exporter:v1.0.0 |


# Grafana setting for ERSAP wf:
- The volume mount path in the dev container is`/workspaces/JIRIAF-test-platform/prom/grafana-data`.
- Run grafana image with the script `/workspaces/JIRIAF-test-platform/prom/run-grafana.sh`.
