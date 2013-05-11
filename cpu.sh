#限制某个线程的cpu使用率
sudo cpulimit -p pid -l 50
ps -eo %cpu,args | grep -m1 PROCESS | awk '{print $1}'

#将当前进程按照memory和cpu排序
ps aux --sort=%mem,%cpu

#按照cpu使用率排序
ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed "/^ 0.0 /d"

#查看当前系统的物理cpu个数
grep "processor" /proc/cpuinfo | wc -l	
grep -c -e '^cpu[0-9]\+' /proc/stat

#查看当前cpu型号
grep "model name" /proc/cpuinfo

#查看当前cpu信息
cat /proc/cpuinfo

#查看当前系统的位数
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits
getconf LONG_BIT | grep '64'
java -version

#查看当前系统的cpu频率
awk -F": " '/cpu MHz\ */ { print "Processor (or core) running speed is: " $2 }' /proc/cpuinfo ; dmidecode | awk -F": " '/Current Speed/ { print "Processor real speed is: " $2 }'


#查看每个cpu每个进程的cpu使用率
ps ax -L -o pid,tid,psr,pcpu,args | sort -nr -k4| head -15 | cut -c 1-90

#查看当前中断
cat /proc/interrupts

#查看多个处理器的使用率相关信息
mpstat –P ALL 1

#每个物理CPU中Core的个数：
cat /proc/cpuinfo | grep "cpu cores" | uniq | awk -F: '{print $2}'

#是否为超线程？
#如果有两个逻辑CPU具有相同的”core id”，那么超线程是打开的。
#每个物理CPU中逻辑CPU(可能是core, threads或both)的个数：
cat /proc/cpuinfo | grep "siblings"

#/proc/stat 文件中有一行记录的机器从启动依赖，各个中断序号发生中断的次数。
#这一行以intr开头，接下来的第一个数字是总的中断数目，之后就是分别的中断数目，从0开始。
cat /proc/stat  | grep intr
