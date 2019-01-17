#!/bin/bash

a=0
cat text.txt | while read line
		do
		echo $line
		let a=a+1
		done
echo $a
