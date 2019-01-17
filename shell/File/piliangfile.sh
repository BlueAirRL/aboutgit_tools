#!/bin/bash
if [ ! -d src ]; then
    echo "src 目录不存在！"
    exit 1
fi

if [ -d out ]; then
    rm -r out
fi
mkdir out

function search()
{
    for sub in $1/*
    do
        if [ -f $sub ]; then
            if [[ ${sub##*.} = lua ]]; then
                local dest=${sub/src/out}
		dest=${dest/.lua/.c}
		dest1=${dest}
		echo dest1 $dest1
		echo copy $sub to $dest
                cp $sub $dest
            fi
        elif [ -d $sub ]; then
            newdir=${sub/src/out}
            mkdir $newdir
            search $sub
        fi
    done
}
search ./src

