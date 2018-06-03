# 写过/用过的脚本整理
此处记录、收集工作中用到的脚本


#### java相关
* 备份当前目录下的所有jar：[backup\_jar.sh](./scripts/backup_jar.sh)
* 启动jar包(spring boot)：[start-jar.sh](./scripts/start-jar.sh)
* 停止jar包(spring boot)：[shutdown-jar.sh](./scripts/shutdown-jar.sh)
* 从maven私库下载最新jar/war包：[download\_from\_nexus.sh](./scripts/download_from_nexus.sh)

#### 系统/服务相关
* ssh免密码登录方便脚本(只需第一次输入密码)：[ssh\_key.sh](./scripts/ssh_key.sh)
* 启动、停止、重启某服务的脚本：[xxx\_server.sh](./scripts/xxx_server.sh)
 
#### 目录/文件相关
* 设置/更改 `/etc/hosts` 域名映射：[host\_setting.sh](./scripts/host_setting.sh)
* 统计指定目录下文件数(遍历子目录): [count\_files\_in\_folder.sh](./scripts/count_files_in_folder.sh)


#### 进程相关
* 获得指定程序名字、用户名的PID：[get\_pid\_by\_name.sh](./scripts/get_pid_by_name.sh) (ps -ef|grep xxx也可获得；适用于，获取指定程序的PID，组合其他脚本使用)
* 强制结束某进程(tomcat,java...)：[shutdown-force.sh](./scripts/shutdown-force.sh)
* show-busy-java-threads.sh: [show-busy-java-threads.sh](./scripts/show-busy-java-threads.sh)

#### 网络相关
* 