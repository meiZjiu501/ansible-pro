#!/bin/bash

# set-cluster 创建需要连接的集群信息
kubectl config set-cluster myk8s \
--certificate-authority=/opt/kubernetes/server/bin/cert/ca.pem \
--embed-certs=true \
--server=https://10.4.7.10:7443 \
--kubeconfig=kubelet.kubeconfig

[ $? -eq 0 ] && echo "Cluster myk8s set" && sleep 5 || exit

#set-credentials 创建用户账号
kubectl config set-credentials k8s-node \
--client-certificate=/opt/kubernetes/server/bin/cert/client.pem \
--client-key=/opt/kubernetes/server/bin/cert/client-key.pem \
--embed-certs=true \
--kubeconfig=kubelet.kubeconfig

[ $? -eq 0 ] && echo "User k8s-node set"  && sleep 5 || exit

#set-context 设置context，即确定账号和集群对应关系
kubectl config set-context myk8s-context \
--cluster=myk8s \
--user=k8s-node \
--kubeconfig=kubelet.kubeconfig

[ $? -eq 0 ] && echo "Context myk8s-context create"  && sleep 5 || exit

#use-context 设置当前使用哪个context
kubectl config use-context myk8s-context --kubeconfig=kubelet.kubeconfig

[ $? -eq 0 ] && cat  /opt/kubernetes/server/bin/conf/kubelet.kubeconfig
