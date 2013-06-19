#删除temp文件的重复行
awk '!($0 in array) { array[$0]; print }' temp

#查看最长使用的10个unix命令
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10

#查看机器的ip列表
ifconfig -a | awk '/Bcast/{print $2}' | cut -c 5-19

#查看机器的每个远程链接机器的连接数
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'

#查看某个进程打开的socket数量
ps aux | grep [process] | awk '{print $2}' | xargs -I % ls /proc/%/fd | wc -l


#查看无线网络的ip
sudo ifconfig wlan0 | grep inet | awk 'NR==1 {print $2}' | cut -c 6-

#批量重命名文件
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash

#查看某个用户打开的文件句柄列表
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done

#计算文件temp的第一列的值的和
awk '{s+=$1}END{print s}' temp

#查看最常用的命令和使用次数
history | awk '{if ($2 == "sudo") a[$3]++; else a[$2]++}END{for(i in a){print a[i] " " i}}' |  sort -rn | head

#查找某个时间戳的文件列表
cp -p `ls -l | awk '/Apr 14/ {print $NF}'` /usr/users/backup_dir

#格式化输出当前的进程信息
ps -ef | awk -v OFS="\n" '{ for (i=8;i<=NF;i++) line = (line ? line FS : "") $i; print NR ":", $1, $2, $7, line, ""; line = "" }'

#查看输入数据的特定位置的单个字符
echo "abcdefg"|awk 'BEGIN {FS="''"} {print $2}'

#打印行号
ls | awk '{print NR "\t" $0}'

#打印当前的ssh 客户端
netstat -tn | awk '($4 ~ /:22\s*/) && ($6 ~ /^EST/) {print substr($5, 0, index($5,":"))}'

#打印文件第一列不同值的行
awk '!array[$1]++' file.txt

#打印第二列唯一值
awk '{ a[$2]++ } END { for (b in a) { print b } }' file

#查看系统所有分区
awk '{if ($NF ~ "^[a-zA-Z].*[0-9]$" && $NF !~ "c[0-9]+d[0-9]+$" && $NF !~ "^loop.*") print "/dev/"$NF}'  /proc/partitions

#查看2到100所有质数
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo

#查看第3到第6行
awk 'NR >= 3 && NR <= 6' /path/to/file

#逆序查看文件
awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }'

#打印99乘法表
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")}'
