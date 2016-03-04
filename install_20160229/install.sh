#!/bin/sh
# 初始化各种路径

# 当前路径
DIR_PATH=$(pwd)

# 当前路径下的文件夹
DIRS=$(/bin/ls -d $DIR_PATH/*/)

# 在每个目录中查看是否存在install.sh有的话，则执行
for DIR_NAME in $DIRS
do
    if [ -f $DIR_NAME/install.sh ];then
        DIR_TEMP=${DIR_NAME%/}
        MODEL_NAME=${DIR_TEMP##*/}
        cd $DIR_PATH
        INSTALL="cd $MODEL_NAME && sh $DIR_NAME""install.sh"
        
        while true
        do
            read -n 1 -p "检测到模块:[$MODEL_NAME],是否安装(y/n):" strAnswer
            case $strAnswer in
                [y])
                    echo "\n安装模块:$INSTALL"
                    eval $INSTALL
                    break
                    ;;
                [n])
                    echo "\n"
                    break
                    ;;
                *)
                    echo "\n请输入正确选项(y/n)"
                    ;;
            esac
        done
    fi
done

