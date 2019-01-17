#!/bin/bash
#创建文件
if [ ! -d testdir ]; then
	mkdir testdir
fi

cd testdir
if [ ! -f test.lua.bak.2017 ]; then
	touch test.lua.bak.2017
fi

if [ ! -d subdir ]; then
	mkdir subdir
	cd subdir
	touch init.lua
	cd ..
fi
cd ../
#遍历所有文件
function searchFile()
{
	echo now in $1
	for file in $1/*
	do
		if test -f $file; then
			echo $file
		elif test -d $file; then
			searchFile $file
		fi
	done
}
searchFile ./testdir
