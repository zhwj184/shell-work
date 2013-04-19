#统计apache cookie log中访问频率最高的20个ip和访问次数
cat cookielog | awk '{ a[$1] += 1; } END { for(i in a) printf("%d, %s\n", a[i], i ); }' | sort -n | tail -20

#统计apache cookie log中返回404的url列表
awk '$11 == 404 {print $8}' access_log | uniq -c | sort -rn | head

#统计一个ip访问超过20次的ip和访问次数列表，把$1改为url对应的$9,则可以统计每个url的访问次数
cat access_log | awk '{print $1}' | sort | uniq -c | sort -n | awk '{ if ($1 > 20)print $1,$2}'

#统计每个url的平均访问时间
cat cookielog | awk '{ a[$6] += 1; b[$6] += $11; } END { for(i in a) printf("%d, %d, %s\n", a[i],a[i]/b[i] i ); }' | sort -n | tail -20


#打印访问apache的新ip列表
tail -f access.log | awk -W interactive '!x[$1]++ {print $1}'

#通过日志查看当天指定ip访问次数过的url和访问次数:
cat access.log | grep "10.0.21.17" | awk '{print $7}' | sort | uniq -c | sort –nr


#通过日志查看当天访问次数最多的时间段
awk '{print $4}' access.log | grep "26/Mar/2012" |cut -c 20-50|sort|uniq -c|sort -nr|head

#查看某一天的访问量
cat access_log|grep '12/Nov/2012'|grep "******.htm"|wc|awk '{print $1}'|uniq 

#查看访问时间超过30ms的url列表
cat access_log|awk ‘($NF > 30){print $7}’|sort -n|uniq -c|sort -nr|head -20 

#列出响应时间超过60m的url列表并统计出现次数
cat access_log |awk ‘($NF > 60 && $7~/\.php/){print $7}’|sort -n|uniq -c|sort -nr|head -100 

#排除搜索引擎后的url访问次数
sed "/Baiduspider/d;/Googlebot/d;/Sogou web spider/d;" xxx.log|awk -F' ' '{print $7}'|sort | uniq -c | sort -k1,2 -nr 

#统计/index.html页面的访问uv
grep "/index.html" access.log | cut –d “ ” –f 4| sort | uniq | wc –l 