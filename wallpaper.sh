#!/usr/bin/sh

pwsave=600
trap 'exit;' SIGTERM SIGINT
if [ $2=shufall ];
then
    while :
    do
	files=;
	dirs=`find $3 -type d`
	for dir in ${dirs// /aZ41}
	do
	    files=$files$(ls "${dir//aZ41/ }"/*.{jpg,png,jpeg,bmp} 2>/dev/null)
	done
	for file in $(shuf -e ${files// /aZ41})
	do
	    echo "${file//aZ41/ }"
	    feh --bg-fill "${file//aZ41/ }"
	    if [ `cat /sys/class/power_supply/AC0/online` -eq 0 ]
	    then
		if [ $1 -gt $pwsave ]
		then
		    sleep $1
		else
		    sleep $pwsave
		fi
	    else	    
		sleep $1
	    fi
	    
	done
    done
else
    while :
    do
	for file in $(
			 dirs=`find $3 -type d`
			 for dir in $(shuf -e ${dirs// /aZ41})
			 do
			     files=`ls "${dir//aZ41/ }"/*.{jpg,png,jpeg,bmp} 2>/dev/null`
			     echo $(shuf -e ${files// /aZ41})
			 done
		     );
	do
	    echo "${file//aZ41/ }"
	    feh --bg-fill "${file//aZ41/ }"
	    if [ `cat /sys/class/power_supply/AC0/online` -eq 0 ]
	    then
		if [ $1 -gt $pwsave ]
		then
		    sleep $1
		else
		    sleep $pwsave
		fi
	    else	    
		sleep $1
	    fi
	done
    done
fi
    
    
    
