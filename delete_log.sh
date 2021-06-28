#/bin/bash
#清除某个目录下的日志
for i in `find  /www/wwwlogs  -name "*.log"`;
do cat /dev/null >$i;
done