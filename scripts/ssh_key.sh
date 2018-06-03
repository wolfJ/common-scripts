#!/bin/bash
FORCE=
HOST_CONFIG=

function initKeyAndCopyToDest() {
  if [ ! -e ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -P ''
  fi

  SSH_KEY=`awk -F ' ' '{print substr($2,213)}' ~/.ssh/id_rsa.pub`;
  if [ ${FORCE} ]; then
    SSH_COMMAND="mkdir -p /root/.ssh/; touch /root/.ssh/authorized_keys; cat > /root/.ssh/.${SSH_KEY}; cat /root/.ssh/.${SSH_KEY} >> /root/.ssh/authorized_keys; echo force-sucess; "
  else
    SSH_COMMAND="mkdir -p /root/.ssh/; touch /root/.ssh/authorized_keys; if [ -e /root/.ssh/.${SSH_KEY} ]; then echo exist; else cat > /root/.ssh/.${SSH_KEY}; cat /root/.ssh/.${SSH_KEY} >> /root/.ssh/authorized_keys; echo sucess; fi;"
  fi

  HOST_IP=$1;
  cat ~/.ssh/id_rsa.pub|ssh root@${HOST_IP} ${SSH_COMMAND}
}


# 参数处理 -c
while getopts "c:f" arg #选项后面的冒号表示该选项需要参数
do
    case $arg in
        c)
            #参数存在$OPTARG中
            HOST_CONFIG=$OPTARG
            if [ ! -e ${HOST_CONFIG} ]; then echo "config file not exist!"; exit 1; fi
            echo "use config file:${HOST_CONFIG}"
            ;;
        f)
            # 强制刷新
            FORCE=0
            ;;
        ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
            exit 1
        ;;
    esac
done
shift $((OPTIND-1))


if [ ${HOST_CONFIG} ] ; then
    HOST_LIST=`cat ${HOST_CONFIG} |grep '^[^# ]'`
    for KEY in ${HOST_LIST} ; do
        HOST=`echo $KEY | awk -F ':' '{print $1}'`
        initKeyAndCopyToDest ${HOST}
    done
elif [ $1 ]; then
	initKeyAndCopyToDest $1
else
	echo -e "Usage: `basename $0` [-c host-net.conf (指定多个主机，指定时以配置文件为准，IP参数将不生效)] [-f (强制刷新目标主机)] ip"
fi
