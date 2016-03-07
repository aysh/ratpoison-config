#!/usr/bin/sh

trap 'exit;' SIGTERM SIGINT
while [[ True ]]
do
    if [[ $(ls ~/.mail/personal/Inbox/new; ls ~/.mail/resnova/Inbox/new) ]]
    then
	ratpoison -c "msgwait 1"
	ratpoison -c "echo You've Got Mail!"
	ratpoison -c "msgwait 5"
	sleep 2
    else
	if [[ ($(cat /sys/class/power_supply/BAT0/capacity) > 75) && ($(cat /sys/class/power_supply/BAT0/status) == Charging)  ]]
	then
	    ratpoison -c "msgwait 2"
	    ratpoison -c "echo Disconnect Charger!"
	    ratpoison -c "msgwait 5"
	elif [[ ($(cat /sys/class/power_supply/BAT0/capacity) < 25) && ($(cat /sys/class/power_supply/BAT0/status) == Discharging) ]]
	then
	    ratpoison -c "msgwait 2"
	    ratpoison -c "echo Connect Charger!"
	    ratpoison -c "msgwait 5"n
	fi
	sleep 5
    fi
done

    


    
