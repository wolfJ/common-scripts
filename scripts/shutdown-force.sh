#!/bin/bash
#该脚本需放在tomcat/bin下
#force shutdown tomcat,copy this sh file to tomcat/bin dir

path=${PWD}
pname=java

ps -ef|grep $path|grep $pname|awk '{print $2}'

echo "exec $path/shutdown.sh"
sh $path/shutdown.sh

sum=45
while (($sum > 0))
do
    sum=$(($sum - 2))
	pid=`ps -ef|grep $path|grep $pname|awk '{print $2}'`
	#判断，休息或退出
	if [ ${pid[0]} ]; then
		sleep 2s
	else
		break
	fi
done


#kill -9 pid
ps -ef|grep $path|grep $pname|awk '{print $2}'|xargs kill -9 &>/dev/null

#success msg
echo "shutdown success"

ps -ef|grep $path|grep $pname|awk '{print $2}'