##########################################################################
# File Name: createPro.sh
# Author: rlj
# mail: amoscykl980629@163.com
# Created Time: Wed 16 Jan 2019 12:26:02 PM CST
#########################################################################
#!/bin/bash

read -p "please input project name(请输入工程名): " projectName
read -p "please input package name(请输入包名  ): " packageName
read -p "Create 0(Java project) or 1(web project):" projectType


JavaproType=maven-archetype-quickstart
WebproType=maven-archetype-webapp
typeGroupId=org.apache.maven.archetypes

if [ $projectType == 1 ];then

	mvn archetype:generate -DgroupId=$packageName -DartifactId=$projectName -DarchetypeGroupId=$typeGroupId -DarchetypeArtifactId=$WebproType -DarchetypeVersion=1.4 -DinteractiveMode=false

else

	mvn archetype:generate -DgroupId=$packageName -DartifactId=$projectName -DarchetypeArtifactId=$JavaproType -DarchetypeVersion=1.4 -DinteractiveMode=false
fi

if [ 0 -eq 1 ];then

	if [ ! -d $projectName ];then
		echo project $projectName is creating...
	else
		echo $projectName is existed!
	fi

	#create project
	mvn archetype:generate -DgroupId=$packageName -DartifactId=$projectName -DarchetypeArtifactId=proType-DarchetypeVersion=1.4 -DinteractiveMode=false

	cd $projectName

	#build project
	mvn package

	#test project
	java -cp target/${projectName}-1.0-SNAPSHOT.jar ${packageName}.App


	mvn clean dependency:copy-dependencies package

	#generate site readme介绍工程的各种依赖关系jar包，插件等
	mvn site

	#install 安装jar包到本地仓库
	mvn install

	#clean target 删除编译生成的无用文件
	read -p "是否删除target文件(内含编译生成的文档)(Y/N ?): " flag
	if [[ "$flag" == Y* ]];then
		mvn clean
		echo 已删除target文件夹
	else
		echo 未删除target文件夹
	fi
fi
