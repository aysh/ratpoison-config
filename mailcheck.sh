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
	sleep 10
    fi
done

    


    
