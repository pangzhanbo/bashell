#!/bin/sh
DATE=$(/bin/date +%Y%m%d)
DIR_NAME=$1_$DATE
/bin/mkdir $DIR_NAME && cd $DIR_NAME && echo $2 > profile.log
