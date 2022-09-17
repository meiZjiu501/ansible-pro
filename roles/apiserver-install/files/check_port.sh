#!/bin/bash
if [ $# -eq 1 ] && [[ $1 =~ ^[0-9]+ ]];then
    [ $(netstat -lntp|grep ":$1 " |wc -l) -eq 0 ] && echo "[ERROR] nginx may be not running!" && exit 1 || exit 0
else
    echo "[ERROR] need one port!"
    exit 1
fi