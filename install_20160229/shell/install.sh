#!/bin/sh
DIR_ROOT=$(pwd)
DIR_NAME=${DIR_ROOT##*/}
echo "正在安装模块:$DIR_NAME"


#将文件夹中的文件都放在用户目录中
SHELL_DIR=$HOME"/.shell"
[ -d $SHELL_DIR ] && rm -rf $SHELL_DIR
mkdir $SHELL_DIR && echo "创建文件夹$SHELL_DIR"
SHELL="cp $DIR_ROOT/* $SHELL_DIR"
eval $SHELL && echo $SHELL

# 读取目录下所有sh文件，install.sh除外
LC_ALL=$(ls $SHELL_DIR|grep -v install.sh)
for FILE_NAME in $LC_ALL
do
    # 获得文件中.sh前的文件名，作为命令名称
    COMMAND_NAME=${FILE_NAME%.*}
    # 判断在环境变量中，这个文件名是否存在
    # 如果不存在，则以 alias 模式添加到自定义的用户变量中
    strFind=$(grep " $COMMAND_NAME" $HOME/.profile_pzb|awk -F '=' '{print $1}'|awk -F ' ' '{print $2}')
    [ ! $strFind ] && [ -f $SHELL_DIR/$FILE_NAME ] && [ -f $HOME/.profile_pzb ] && echo "alias $COMMAND_NAME=\". $SHELL_DIR/$FILE_NAME\"" >> $HOME/.profile_pzb
done
source $HOME/.profile_pzb
