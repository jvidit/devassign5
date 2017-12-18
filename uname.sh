#!/bin/sh


declare file
read file


declare name
read name
declare -i count=3
declare -i n=0
n=`echo $name | wc -c`-1
declare str
declare final
declare -i y=0

IFS=''

if [[ $file == '' ]] || [[ $name == '' ]]
then
    echo -1
else
    while read -n$(($n+1)) str
    do
        if [[ $y == 0 ]]
        then
            if [[ "$str" == "$name:" ]]
            then
                n=0
                y=1
				
            fi
	
        else

            if [[ count -gt 0 ]]
            then
                if [[ $str == ":" ]]
                then
                    count=$count-1
                fi
		
            else
                if [[ $str == ":" ]]
                then
                    n=10000
                elif [[ n -lt 10000 ]]
                then
                    final="$final$str"
                fi
            fi
        fi
    done < $file
    if [[ $y == 1 ]]
    then
        echo $final
    else
        echo -1
	fi
fi
