if [ -z $1 ];then
	exit 1
fi

if [ -z $2 ];then
	exit 2
fi

if [ ! -f $1 ];then
	exit 3
fi

srcFullFile=$1
desFullFile=$2
srcFilePath=$(sh ~/shell/bashell/DIR.sh $(dirname $srcFullFile))"/"
desFilePath=$(sh ~/shell/bashell/DIR.sh $(dirname $desFullFile))"/"
srcFileName=${srcFullFile##*/}
desFileName=${desFullFile##*/}

if [ -L $2 ];then
	echo "delete the link file:["$desFullFile"]"
	rm $desFullFile
fi

ln -s $srcFilePath$srcFileName $desFilePath$desFileName
