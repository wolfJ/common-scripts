#!/bin/bash
jvmParam=-Xmx1024M

#jvmJmxParam='-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=11111 -Djava.rmi.server.hostname=192.168.x.x'

path=$(cd `dirname $0`; pwd)
jarFileName=
function getJarFile(){
    for i in $path/*.jar; do
        if [ -r "$i" ]; then
            if [ ! $jarFileName ]; then
                jarFileName=$i
            else
                echo "error:found multi jar file:"
                echo "$jarFileName"
                echo "$i"
                jarFileName=
            fi
        fi
    done
}

getJarFile
if [ $jarFileName ]; then
    echo "nohup java $jvmParam -jar $jarFileName > $path/spring-boot.log 2>&1 &"
    nohup java $jvmParam -jar $jarFileName > $path/spring-boot.log 2>&1 &
    echo -e 'start ok! \r\n \r\n \r\n \r\n\r\n \r\n'
    echo "tail -f $path/spring-boot.log"
    echo -e "\r\n\r\n\r\n\r\n"
    tail -f $path/spring-boot.log
else
    echo "warring:not found *.jar or multi jars in path: $path"
fi