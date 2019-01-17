#!/bin/bash

a=0
while read line
do

echo $line

let a=a+1

done < text.txt

echo $a
