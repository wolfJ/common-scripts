# bash常用语法
整理出常用语法，和注意点  


### 运算

	a=`expr "$a" + "$num"`
	a=$(($a+$num))
	((a=a+num))
	let a=a+num	
	((a+=num))
	

linux中shell变量$#,$@,$0,$1,$2的含义解释: 

	变量说明: 
	$$ 
	Shell本身的PID（ProcessID） 
	$! 
	Shell最后运行的后台Process的PID 
	$? 
	最后运行的命令的结束代码（返回值） 
	$- 
	使用Set命令设定的Flag一览 
	$* 
	所有参数列表。如"$*"用「"」括起来的情况、以"$1 $2 … $n"的形式输出所有参数。 
	$@ 
	所有参数列表。如"$@"用「"」括起来的情况、以"$1" "$2" … "$n" 的形式输出所有参数。 
	$# 
	添加到Shell的参数个数 
	$0 
	Shell本身的文件名 
	$1～$n 
	添加到Shell的各参数值。$1是第1参数、$2是第2参数…。 



文件比较运算符

	-e filename	如果 filename 存在，则为真	[ -e /var/log/syslog ]
	-d filename	如果 filename 为目录，则为真	[ -d /tmp/mydir ]
	-f filename	如果 filename 为常规文件，则为真	[ -f /usr/bin/grep ]
	-L filename	如果 filename 为符号链接，则为真	[ -L /usr/bin/grep ]
	-r filename	如果 filename 可读，则为真	[ -r /var/log/syslog ]
	-w filename	如果 filename 可写，则为真	[ -w /var/mytmp.txt ]
	-x filename	如果 filename 可执行，则为真	[ -L /usr/bin/grep ]
	filename1 -nt filename2	如果 filename1 比 filename2 新，则为真	[ /tmp/install/etc/services -nt /etc/services ]
	filename1 -ot filename2	如果 filename1 比 filename2 旧，则为真	[ /boot/bzImage -ot arch/i386/boot/bzImage ]

字符串比较运算符 （请注意引号的使用，这是防止空格扰乱代码的好方法）

	-z string	如果 string 长度为零，则为真	[ -z "$myvar" ]
	-n string	如果 string 长度非零，则为真	[ -n "$myvar" ]
	string1 = string2	如果 string1 与 string2 相同，则为真	[ "$myvar" = "one two three" ]
	string1 != string2	如果 string1 与 string2 不同，则为真	[ "$myvar" != "one two three" ]

算术比较运算符

	num1 -eq num2	等于	[ 3 -eq $mynum ]
	num1 -ne num2	不等于	[ 3 -ne $mynum ]
	num1 -lt num2	小于	[ 3 -lt $mynum ]
	num1 -le num2	小于或等于	[ 3 -le $mynum ]
	num1 -gt num2	大于	[ 3 -gt $mynum ]
	num1 -ge num2	大于或等于	[ 3 -ge $mynum ]

多条件if控制

	if [condition1] && [conditio2]; then
		echo 'xxx'
	fi
	
### 有用语法/函数
#### sed 命令
sed是一种流编辑器，它是文本处理中非常中的工具，能够完美的配合正则表达式使用。处理时，把当前处理的行存储在临时缓冲区中，称为“模式空间”（pattern space），接着用sed命令处理缓冲区中的内容，处理完成后，把缓冲区的内容送往屏幕。接着处理下一行，这样不断重复，直到文件末尾。  
**命令格式:**  
[查看详解](http://man.linuxde.net/sed)  
`sed [options] 'command' file(s)`  或 `cat file|sed [options] 'command'`  


字符串替换: `sed "s/${old}/${new}/g"`  
文件中字符串替换: `sed -i "s/${old}/${new}/g" /file_path`  
字符串去前空格: `echo "   xx   "|sed 's/^[ \t]*//g'`  
字符串去后空格: `echo "   xx   "|sed 's/[ \t]*$//g'`  
字符串去所有空格: `echo "   xx   "|sed s/[[:space:]]//g`  

#### grep命令
grep（global search regular expression(RE) and print out the line，全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。  
**命令格式:**  
[查看详解](http://man.linuxde.net/grep)  
`grep "match_pattern" file_name` 或 `cat file|grep "match_pattern"`




#### 引用
(有些内容整理自网络，因内容较分散，未能全部标明出处！)  
命令手册(强烈推荐)：[http://man.linuxde.net](http://man.linuxde.net)    
https://blog.csdn.net/ithomer/article/details/6836382

