#!/bin/sh

function scanDir() {
    local cur_dir parent_dir workdir
    workdir=$1
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
        echo cur_dir
    fi

    for dirlist in $(ls ${cur_dir})
    do
        if test -d ${dirlist};then
            cd ${dirlist}
            scandir ${cur_dir}/${dirlist}
            cd ..
        else
            echo ${cur_dir}/${dirlist}
        fi
    done
}

if test -d $1
then
    scandir $1
elif test -f $1
then
echo "路径输入不正确"
    exit 1
else
    echo "输入的文件夹未创建"
    exit 1
fi