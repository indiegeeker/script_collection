#!/bin/bash
date=`date +%Y_%m_%d'___'%H_%M_%S`
#######################################
project_path=$(cd `dirname $0`; pwd)
#######################################
start_time=`date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"`
u="puser"
p="!O2222n"
ip="127.0.0.1"
port="3306"
pwd="/opt/Myslq_Backup"
mysql -u$u -p$p "-e show databases;" |awk '{print $1}' |egrep -v -e "Database" -e  "performance_schema" -e "information_schema"  > $pwd/Database_text
for i in `(cat  $pwd/Database_text)`
do
        mysqldump  -u$u -p$p   $i  > $pwd/${i}_$date.sql
        gzip  $pwd/${i}_$date.sql
done
find   $pwd/    -mtime +30   -name "*.gz" -exec rm -rf {} \;
finish_time=`date --date='0 days ago' "+%Y-%m-%d %H:%M:%S"`
duration=$(($(($(date +%s -d "$finish_time")-$(date +%s -d "$start_time")))))
echo -e "\033[41m 本次执行脚本耗时: $duration秒 \033[0m"
