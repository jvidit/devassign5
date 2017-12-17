#!/bin/sh

declare path
read path
cd $path
declare type
read type
declare -i count=0

for i in *
do
	if [[ $i == *$type ]]
	then
		count=$count+1
	fi
done

echo $count	
