#!/bin/sh

declare path
read path
cd path
declare -i count=0

for i in *
do
	if [ "$i"=="^.pdf" ]
	then
		count=$count+1
	fi
done

echo $count	
