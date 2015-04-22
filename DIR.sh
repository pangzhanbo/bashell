if [ -z $1 ];then
	echo "parmas 1 is invailed"
	exit 1
fi

basePath=$(cd $1;pwd)
echo $basePath
