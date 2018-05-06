# bash常用语法
整理出常用语法，和注意点  


### 运算

	a=`expr "$a" + "$num"`
	a=$(($a+$num))
	((a=a+num))
	let a=a+num	
	((a+=num))
	









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





#### 引用
(有些内容整理自网络，因内容较分散，未能全部标明出处！)  
https://blog.csdn.net/ithomer/article/details/6836382

