#!/bin/bash
#SBATCH -N 1
#SBATCH -C cpu
#SBATCH -q debug
#SBATCH -J ersap
#SBATCH -t 00:30:00

#run the application:



export NODENAME="vk-nersc"
export KUBECONFIG="/global/homes/j/jlabtsai/run-vk/kubeconfig/mylin"


ssh -NfL 33469:localhost:33469 mylin

shifter --image=docker:jlabtsai/vk-cmd:no-vk-container -- /bin/bash -c "cp -r /vk-cmd `pwd`"

cd `pwd`/vk-cmd

./start.sh $KUBECONFIG $NODENAME
