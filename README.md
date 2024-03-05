# Branches used for testing

| Test platform | vk-cmd | J-process-exporter |
| :------------ | :----- | :----------------- |
| test-ersap    | main   | pgid               |

# Docker images used for testing

| Test platform | vk-cmd | J-process-exporter |
| :------------ | :----- | :----------------- |
| test-ersap-wf | main   | pgid-go            |


# Description of files for the tests
All the tests located in the `main` directory.

| File name | Description |
| :-------- | :---------- |
| anomaly-main/run-this-first.yaml | Run this file first to create bash scripts for getting pgid of the ERSAP wf container and for running the J-process-exporter |
| anomaly-main/ersap.yml | Create ERSAP wf docker container |
| anomaly-main/stress-docker.yaml | Create stress docker container |
| anomaly-main/kill.yaml | Kill container and its processes |
| - | - |
| start-ejfat/ssh.sh | Important commands for creating ssh tunnels for monitoring ERSAP (running from local) |
| start-ejfat/monitor.sh | Some useful commands for monitoring |
