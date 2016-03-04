#!/bin/sh
# 判断是否已经添加了自定义的环境变量
DIR_ROOT=$(pwd)
DIR_NAME=${DIR_ROOT##*/}
echo "正在安装模块:$DIR_NAME"

PZB_PROFILE=$HOME/.profile_pzb
USER_PROFILE=$HOME/.profile

if [ ! -f $PZB_PROFILE ];then
    # 没有添加的话，在这个里面追加自己的环境变量，并且创建用户变量文件
    echo "[[ -s $PZB_PROFILE ]] && source $PZB_PROFILE" >> $USER_PROFILE
    if [ -f .profile_pzb ]; then
        cp .profile_pzb ~/
    else
        echo "# profile_pzb" >> $PZB_PROFILE
    fi
    ########可以在这里添加一些用户变量的东西,缺点只能加一次#######

    ###############

    source $USER_PROFILE
fi
