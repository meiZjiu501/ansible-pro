#!/bin/sh
WORK_DIR=$(dirname $(readlink -f $0))
[ $? -eq 0 ] && cd $WORK_DIR || exit

/opt/kubernetes/server/bin/kube-scheduler \
    --leader-elect  \
    --log-dir /data/logs/kubernetes/kube-scheduler \
    --master http://127.0.0.1:8080 \
    --v 2