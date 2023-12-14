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
        sh prom/prometheus.yml
    ``` 
  - The prometheus server will be running on port 9090.
  - The data will be stored in the host machine under the directory: `$HOME/JIRIAF/prom-data/data`
  - The volume is mounted to the container at `/prometheus/data`
  - The scraping setting is in the file `prom/prometheus.yml`

# Grafana setting:
- Run the grafana server with the following command:
    ```bash
        sh prom/run-grafana.sh
    ``` 
  - The grafana server will be running on port 3000.
  - The data will be stored in the host machine under the directory: `$HOME/JIRIAF/prom-data/grafana`
  - The volume is mounted to the container at `/var/lib/grafana`

# Run jobs via FireWorks:
- To generate the workflows and store them in the database, run the following command:
    ```bash
        python vk/FireWorks/gen_wf.py
    ```
- To launch the wf with 2 mins interval and 1 job per launch, run the following command:
    ```bash
        #!/bin/bash
        # Run the function every 10 minutes for 10 times
        for i in {1..2}
        do
            qlaunch -c /global/homes/j/jlabtsai/config/project/ersap_hz_scale/ersap-node1 -r rapidfire --nlaunches 1
            sleep 120
        done
    ```
  
# ERSAP wf jobs
- To run 8 wfs to 8 vk-nodes/SLURM jobs with 1 node each, load the configmaps and pods of `vk/configmap/jobs/configmap.yml` and `vk/pods/jobs/pod.yml` respectively.
- There are 1 configmap `wf` for the workflow and 8 configmaps `prom-node-1` to `prom-node-8` for the ERSAP exporter and process exporter.
- Pods and configmaps should be created before submitting the FireWorks jobs. The pods will be running on the nodes specified in the `kubernetes.io/hostname` field of the pods. This is to restrict the pods to run on the specified nodes.
- To run a single wf for testing, use `vk/configmap/ersap_wf.yml`.
  
# Stress test
- To run the stress test, load the `vk/configmap/stress.yaml`. This should be used for testing the setting for `vk-cmd` and `J-process-exporter`.


# Environment variables in pod configuration files
- `workdir`: the working directory of the pod. Any `~` and `$HOME` will be replaced by the home directory of the user.
- `PGID_FILE`: the file to store the process group id of the pod. The file will be created automatically by `vk-cmd`, and the mount path should be the one that mounts the volume containing name of `pgid` in the pod configuration file. See the following example.

    ```yaml
    env:
    - name: PGID_FILE
        value: ~/ersap/run/wf-node1/pgid/wf.pgid # name of the .pgid file is the name of container
    volumeMounts:
    - name: pgid-wf
        mountPath: ~/ersap/run/wf-node1/pgid
    volumes:
    - name: pgid-wf
        emptyDir: {}
    ```
- `HOME`: the home directory of the user. Simply use `$HOME` in the pod configuration file.
- `PROM_SERVER`: the address of the prometheus server.
- `PROCESS_EXPORTER_PORT`: this is the port of the process exporter. Must set or the process exporter will not be running.