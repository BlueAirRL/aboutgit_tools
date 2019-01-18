##########################################################################
# File Name: gitpush.sh
# Author: xxx
# mail: xxx@163.com
# Created Time: Fri 18 Jan 2019 10:21:11 AM CST
#########################################################################
#!/bin/bash
#$# 是传给脚本的参数个数
#$0 是脚本本身的名字
#$1 是传递给该shell脚本的第一个参数
#$2 是传递给该shell脚本的第二个参数
#$@ 是传给脚本的所有参数的列表

echo git add $1
git add $1
echo git commit -m $2
git commit -m $2
echo git push origin master
git push origin master
echo push finished



