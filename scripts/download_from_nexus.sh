#!/bin/bash

# 从maven库中解析maven-metadata.xml，下载对应的jar/war包。
# 1.下载项目的metadata文件，2.解析最新版本号，3.下载对应版本的metadata文件，4.解析具体jar文件，下载。

path=$(cd `dirname $0`; pwd)

if [ ! $1 ]; then
	echo "Usage: `basename $0` {xxxxxx-server|other-server}"
	exit 0
fi

module=$1

ver_meta_file=version_maven-metadata.xml
jar_meta_file=jar_maven-metadata.xml

last_version=
#指定maven私库的地址
base_url="http://192.168.0.100:8080/nexus/service/local/repositories/snapshots/content/com/xxxx-company/xxxx-project/"

function downloadVersionMetaFile(){
	echo "----------------------------------------"
	echo "begin download maven version metafile..."
	file_url=${base_url}${module}/maven-metadata.xml
	#rm ${path}/${ver_meta_file}
	wget -O ${path}/$ver_meta_file ${file_url}
	echo -e "finished. \r\n\r\n"
}

function parseVersionValue(){
	echo "----------------------------------------"
	echo "begin parse maven last version..."
	#解析xml中<version>xxxx</version>的内容，返回数组
	array=($(sed -nr 's_<version>(.*)</version>_\1_p' $ver_meta_file)) 
	#echo ${array[@]}
	last_version=${array[${#array[@]}-1]}
	echo -e "finished.  $module: last version is $last_version \r\n\r\n"
}
	
function downloadJarMetaFile(){ 
	echo "----------------------------------------"
	echo "begin download maven jar metafile..."
        file_url=${base_url}${module}/$last_version/maven-metadata.xml
        #rm ${path}/${jar_meta_file}
        wget -O ${path}/$jar_meta_file ${file_url}
	echo -e "finished. \r\n\r\n"
}

function getJarFile(){
	echo "----------------------------------------"
	echo "begin download maven jar file..."
	data=`cat ${path}/$jar_meta_file`
	#解析xml中<value>xxx</value>,返回第一个匹配成功的值
	value=$(grep -oPm1 "(?<=<value>)[^<]+" <<< "$data")
	file_url=${base_url}${module}/$last_version/$module-${value}.jar
	wget $file_url
	echo -e "finished. \r\n\r\n"
}

downloadVersionMetaFile

parseVersionValue

downloadJarMetaFile

getJarFile
