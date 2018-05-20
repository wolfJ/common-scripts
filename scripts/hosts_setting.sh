#!/bin/bash

if [ ! $2 ]; then
	echo "用法: `basename $0` domainNme ipAddr"
	exit 0
fi

domain_name=$1
ip_address=$2

if [ $1 =="localhost" ] || [ $1 =="localhost.local" ] ; then
	echo "ignore domain [localhost]"
	exit 0
fi


#拼接新的 host.
new_host="${ip_address}   ${domain_name}"

#找出旧的 host
old_host=`cat /etc/hosts |grep ${domain_name}`

#changing host ip.
if [ old_host ] ; then
    echo "before host setting:"
    echo "${old_host}"
    sed -i "s/${old_host}/${new_host}/g" /etc/hosts
else
    echo ${new_host} >> /etc/hosts
fi
echo "after host setting:"
cat /etc/hosts |grep ${new_host}