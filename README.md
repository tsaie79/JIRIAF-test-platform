# Branches used for testing

| Test platform                    | vk-cmd          | J-process-exporter |
| :------------------------------- | :-------------- | :----------------- |
| test-ersap-wf-horizontal-scaling | no-vk-container | pgid               |




# Docker images used for testing
| Test platform                    | vk-cmd          | J-process-exporter |
| :------------------------------- | :-------------- | :----------------- |
| test-ersap-wf-horizontal-scaling | no-vk-container | pgid-go            |


# Prometheus setting:
- Run the prometheus server with the following command:
    ```bash
        sh run-prometheus.sh
    ``` 
  - The prometheus server will be running on port 9090.
  - The data will be stored in the host machine under the directory: `$HOME/JIRIAF/prom-data/data`
  - The volume is mounted to the container at `/prometheus/data`

# Grafana setting:
- Run the grafana server with the following command:
    ```bash
        sh run-grafana.sh
    ``` 
  - The grafana server will be running on port 3000.
  - The data will be stored in the host machine under the directory: `$HOME/JIRIAF/prom-data/grafana`
  - The volume is mounted to the container at `/var/lib/grafana`

