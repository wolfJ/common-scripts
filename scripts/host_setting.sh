#!/bin/bash

function hostSetting() {
    HOST_NAME=$1
    HOST_IP=$2
    NEW_HOST="${HOST_IP}   ${HOST_NAME}"
    # 先去除满足全字匹配的行，保存到临时文件
    cat /etc/hosts |grep -w -v ${HOST_NAME} > /etc/hosts.tmp
    # 备份原文件
    \cp -f /etc/hosts /etc/hosts.bak
    # 改名为 /etc/hosts，追加新记录
    mv -f /etc/hosts.tmp /etc/hosts
    echo "${NEW_HOST}" >> /etc/hosts
    echo "${NEW_HOST} >> /etc/hosts"
}

if [ ! $2 ]; then
    echo -e "Usage: `basename $0` HOST_NAME HOST_IP"
    exit 1
else
    hostSetting $1 $2
fi