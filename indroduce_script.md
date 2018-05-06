# script 介绍
脚本(script)，查看wiki解释：脚本语言(Scripting language),是为了缩短传统的“编写、编译、链接、运行”（edit-compile-link-run）过程而创建的计算机编程语言。

现在，脚本也已成为一个概念模糊，含意较多的词，在不同领域，不同上下文，概念和含意就不一样。但从原始角度去理解，大多也都能解释得通。脚本的一些特性还是存在的：相对简单，定义简短任务，快速开发/修改，解释型。

此处脚本(script)，指的上下文是操作系统，操作系统提供了一套脚本语言，供用户完成与系统交互操作。



### 操作系统
常见操作系统又有Windows, Linux, Unix, mac OS等。

Windows下：批处理（batch file)，文件后缀：*.bat  
Linux下：有多种 Shell (Unix, mac OS下也大都兼容以下几种)

	Bourne Shell（/usr/bin/sh或/bin/sh）
	Bourne Again Shell（/bin/bash）
	C Shell（/usr/bin/csh）
	K Shell（/usr/bin/ksh）
	Shell for Root（/sbin/sh）
	Z shell（zsh）

 然后，由于易用和免费，Bash被广泛使用。同时，Bash 也是大多数Linux系统默认的 Shell。此处也主要关注bash，标准的 shell 脚本首行以 `#!/bin/bash` 开头(顶格)。  
 #! 是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行，即使用哪一种 Shell。

### 参考
bash 的详细语法介绍参见：[http://www.runoob.com/linux/linux-shell.html](http://www.runoob.com/linux/linux-shell.html)


