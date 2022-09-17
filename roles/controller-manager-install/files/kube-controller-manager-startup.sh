#!/bin/sh
WORK_DIR=$(dirname $(readlink -f $0))
[ $? -eq 0 ] && cd $WORK_DIR || exit

/opt/kubernetes/server/bin/kube-controller-manager \
    --cluster-cidr 172.7.0.0/16 \
    --leader-elect \
    --log-dir /data/logs/kubernetes/kube-controller-manager \
    --master http://127.0.0.1:8080 \
    --service-account-private-key-file ./cert/ca-key.pem \
    --service-cluster-ip-range 192.168.0.0/16 \
    --root-ca-file ./cert/ca.pem \
    --v 2