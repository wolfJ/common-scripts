#!/bin/bash
path=$(cd `dirname $0`; pwd)
echo $path

#输出PID
ps -ef|grep $path|grep java|awk '{print $2}'

#正常退出
ps -ef|grep $path|grep java|awk '{print $2}'|xargs kill &>/dev/null

#等待45s
sum=45
while (($sum > 0))
do
    sum=$(($sum - 2))
	pid=`ps -ef|grep $path|grep java|awk '{print $2}'`
	#判断，休息或退出
	if [ ${pid[0]} ]; then
		sleep 2s
	else
		break
	fi
done

#强制退出
ps -ef|grep $path|grep java|awk '{print $2}'|xargs kill -9 &>/dev/null
echo "shutdown success"