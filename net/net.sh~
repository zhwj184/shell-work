#打印tcp连接信息
netstat -tlnp

#统计处于ESTABLISHED 连接状态的ip列表和连接数
netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
