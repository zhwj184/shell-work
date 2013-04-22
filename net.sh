#/bin/sh

#查看http请求的header
tcpdump -s 1024 -l -A -n host 192.168.9.56
tcpdump -s 1024 -l -A src 192.168.9.56 or dst 192.168.9.56
sudo tcpdump -A -s 1492 dst port 80

#本地网络中IP地址为192.168.0.5的主机现在与外界通信的情况
sudo tcpdump -i eth0 src host 192.168.0.5

#查看网卡eth0的http请求的tcp包
tcpdump -i eth0 port http
tcpdump -i eth0 port http or port smtp or port imap or port pop3 -l -A | egrep -i 'pass=|pwd=|log=|login=|user=|username=|pw=|passw=|passwd=|password=|pass:|user:|userna me:|password:|login:|pass |user '


#查看tcp，upd，icmp非ssh的包
tcpdump -n -v tcp or udp or icmp and not port 22


#查看http请求的request 包
sudo tcpdump -i eth0 port 80 -w -


#过滤http响应的get host头信息
sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "GET \/.*|Host\: .*"


#DNS查询请求响应包
sudo tcpdump -i en0 'udp port 53'

#nmap -sP指定使用Ping echo 进行扫描 /24查看目的网络有多少主机处于运行状态
nmap -sP 192.168.0.1
nmap -sP 192.168.0.0/24
nmap -O www.baidu.com

#Netstat主要用于Linux/Unix主机察看自身的网络状况，如开启的端口、在为哪些用户服务以及服务的状态
netstat -a
netstat -nlp

#netcat扫描机器开放的端口
nc -z -v -n 172.31.100.7 21-25

#netcat 命令会连接开放端口21并且打印运行在这个端口上服务的banner信息。
nc -v 172.31.100.7 21

#输出网络的路由表
route

#显示结果包括服务器已经运行了多长时间，有多少登陆用户和对服务器性能的总体评估（load average）。
uptime

#监控 eth1 的网卡的流量 
iftop -i eth1 
#以位元组(bytes 即字节)为单位显示流量(预设是位元 bits): 
iftop -B 
#直接显示 IP, 不进行DNS 反解: 
iftop -n 
#直接显示连接埠编号, 不显示服务名称: 
iftop -N 
#显示某个网段进出封包流量 
iftop -F 192.168.1.0/24 or 192.168.1.0/255.255.255.0 


#网络流量实时监控工具之nload,查看网卡eth0的流量
nload -n eth0

#查看各个网卡的流量
nload -h

#IPTraf是一个网络监控工具,功能比nload更强大,可以监控所有的流量,IP流量,按协议分的流量,还可以设置过滤器
iptraf


#查看网络接口当前配置与接口命名：
ifconfig
#打开（up）或关闭（down）适配器
ifconfig <网络名> <up|down>
#为适配器分配IP地址：
ifconfig <网络名> <ip地址>
#为适配器分配第二个IP地址：
ifconfig <网络名:实例数> <ip地址>

#显示某个网络适配器的驱动信息，适用于查询软件兼容性的情况：
ethtool -i eth0
#显示网络数据：
ethtool -S
#设置适配器连接速度（Mbps）
ethtool speed <10|100|1000>


#iwconfig 查基本的Wi-Fi网络设置，如SSID、channel和加密等细节。此外还可以修改一些高级设置，包括接收敏感度，RTS/CTS，碎片，以及重试数
#显示当前无线设置，包括接口名称：
iwconfig
#设置ESSID（扩展服务设置识别器）或网络名：
iwconfig <接口名> essid <网络名>


#wget
wget -S --spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

#查看mac地址
cat /sys/class/net/*/address

#查看eth0的ip
ifconfig eth0 | awk '/inet addr/ {split ($2,A,":"); print A[2]}'

#curl 查看页面对应的domail name
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'

#talnet
telnet localhost 6666

#查看所有的网络接口
awk '{print $1}' /proc/net/dev|grep :|sed "s/:.*//g"


#查看DNS server版本好
nslookup -q=txt -class=CHAOS version.bind NS.PHX5.NEARLYFREESPEECH.NET
