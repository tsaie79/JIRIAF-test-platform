#!/bin/bash

# this should be run at host not ejfat


export NODENAME="vk-ejfat"
export APISERVER_PORT="46859"
ssh -NfR $APISERVER_PORT:localhost:$APISERVER_PORT ejfat-fs

export KUBELET_PORT="10250"
ssh -NfL *:$KUBELET_PORT:localhost:$KUBELET_PORT ejfat-fs



#prom process-exporter ersap-1
export PROCESS_EXPORTER_PORT="1776"
ssh -NfL $PROCESS_EXPORTER_PORT:localhost:$PROCESS_EXPORTER_PORT ejfat-fs 

# k8s: stress
export STRESS_PORT="12345"
ssh -NfL $STRESS_PORT:localhost:$STRESS_PORT ejfat-fs

# prom ersap
## 4 pipe
for i in {2221..2224}
do
    j=$((i + 10000))
    ssh -NfL $j:localhost:$i ejfat-fs
done

## 1 pipe
ssh -NfL 2221:localhost:2221 ejfat-fs