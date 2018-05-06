#!/bin/bash

#echo "back up all jars in current directory."

path=$(cd `dirname $0`; pwd)
function backupJarFile(){
    for i in $path/*.jar; do
        if [ -r "$i" ]; then
            mv $i $i.bak
        fi
    done
}

backupJarFile