#!/bin/sh

ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

declare -i temp
temp=0
declare -i final
final=0
declare file
read file

IFS=''
declare c
while read -n1 c
do
	if [[ $c == " " ]]
	then
		a=1
	elif [[ `ord $c` -gt 47 ]] && [[ `ord $c` -lt 58 ]]
	then

		temp=$(( 10 * $temp ))
		temp=$(( $temp + $c ))
	elif [[ `ord $c` -gt 40 ]] && [[ `ord $ ` -lt 48 ]]
	then
        final=$(( $final $c $temp ))
        temp=0
	fi
done < $file

echo $final
