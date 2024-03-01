#!/bin/bash

# this should be run at host not ejfat


export NODENAME="vk-ejfat"
export KUBELET_PORT="10288"
export APISERVER_PORT="43727"


ssh -NfR $APISERVER_PORT:localhost:$APISERVER_PORT ejfat-fs

ssh -NfL *:$KUBELET_PORT:localhost:$KUBELET_PORT ejfat-fs