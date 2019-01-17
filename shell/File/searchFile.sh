#!/bin/bash
searchFile()
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
