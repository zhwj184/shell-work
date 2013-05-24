#按照目录大小排序战士最前面15个目录或者文件
du -xB M --max-depth=2 /var | sort -rn | head -n 15

#列出当前所有子目录的文件大小
du -h --max-depth=1

#列出当前文件或者目录最大的10个
du -s * | sort -n | tail

#按照目录大小从大到小排序
du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'

#列出path这个目录的文件树
du -h /path | sort -h

#每隔60s监控对应目录的文件大小变化
watch -n60 du /var/log/messages


#递归删除当前目录下所有子目录中的.svn目录
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf

#列出当前磁盘的使用情况
df -P | column -t

#监控磁盘的使用情况
watch -d -n 5 df

#列出当前inode的使用情况
df -i  <partition>

#按照每个磁盘使用量从高到低排序
df -h | grep -v ^none | ( read header ; echo "$header" ; sort -rn -k 5)


#查看物理磁盘的使用情况
df -x tmpfs | grep -vE "(gvfs|procbususb|rootfs)"

#查看当前所有磁盘的大小和使用量
df -H

#查看所有分区使用情况
fdisk -l /dev/sda

# 显示系统所有的分区或给定的分区
fdisk -l       
# 显示时，显示的是扇区数不是柱面数           
fdisk -u           
 # 显示指定partition的block数       
fdisk -s partition       

#查看磁盘的读写容量
iostat -m -d /dev/sda1

#测试磁盘的读写速度
hdparm -t /dev/sda

#查看某个文件的所有链接
find -L / -samefile /path/to/file -exec ls -ld {} +

#查看最大的5个文件
find . -type f -exec ls -s {} \; | sort -n -r | head -5

#查看365天前的文件并删除
find ./ -type f -mtime +365 -exec rm -f {} \;

#查看大于100M的文件
find . -type f -size +100M
