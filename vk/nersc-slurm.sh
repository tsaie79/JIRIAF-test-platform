#!/bin/bash
#SBATCH -N 1
#SBATCH -C cpu
#SBATCH -q debug
#SBATCH -J ersap1
#SBATCH -t 00:30:00

#run the application:



export NODENAME="vk-ersap1"
export KUBECONFIG="/global/homes/j/jlabtsai/run-vk/kubeconfig/mylin"

ssh -NfL 33469:localhost:33469 mylin

sh $HOME/docker_img/build-pipe.sh&

shifter --image=docker:jlabtsai/vk-cmd:v20231113 --entrypoint