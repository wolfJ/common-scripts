#!/bin/bash

if [ ! $1 ]; then
	echo "Usage: `basename $0` <Name> [<User(default root)>]"
	exit 0
fi

PsName=$1
PsUser=$2

if [ ! $2 ]; then 
	echo "use default User: root"
	PsUser=root
fi

pid=`ps -u $PsUser|grep $PsName|grep -v grep|grep -v vi|grep -v dbx|grep -v tail|grep -v start|grep -v stop |sed -n 1p |awk '{print $1}'`  
echo $pid
