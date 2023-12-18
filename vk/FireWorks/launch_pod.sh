#!/bin/bash

# check the kubectl get nodes, if the nodes ersap-node1 to ersap-node4 are ready then kubectl apply -f /workspaces/JIRIAF-test-platform/vk/configmap/jobs/pod.yml.

# if the nodes ersap-node1 to ersap-node4 are all redy, then run the following command to create the pods:
# kubectl apply -f /workspaces/JIRIAF-test-platform/vk/configmap/jobs/pod.yml


function check_node_ready {
    node_name=$1
    node_ready=$(kubectl get nodes | grep $node_name | awk '{print $2}')
    if [ $node_ready == "Ready" ]; then
        return 0
    else
        return 1
    fi
}


while true
do
    check_node_ready ersap-node1
    node1_ready=$?
    check_node_ready ersap-node2
    node2_ready=$?
    check_node_ready ersap-node3
    node3_ready=$?
    check_node_ready ersap-node4
    node4_ready=$?
    if [ $node1_ready -eq 0 ] && [ $node2_ready -eq 0 ] && [ $node3_ready -eq 0 ] && [ $node4_ready -eq 0 ]; then
        echo "all nodes are ready"
        kubectl apply -f /workspaces/JIRIAF-test-platform/vk/configmap/jobs/pod.yml
        break
    else
        echo "not all nodes are ready"
        #echo the node status
        echo "node1: $node1_ready"
        echo "node2: $node2_ready"
        echo "node3: $node3_ready"
        echo "node4: $node4_ready"
        sleep 3
    fi
done