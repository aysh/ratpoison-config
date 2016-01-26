#!/bin/sh

## Part I: unmount all existing devices
for disk in $(ls /dev/disk/by-label/)
do
    if ls -d "/media/$(echo -e $disk)"
    then
	ratpoison -c "echo $(udisks --unmount /dev/disk/by-label/$disk)"
    fi
done

## Part II: if mount option given, mount all new devices, update each second
if [ $1 = "mount" ]; then
    PLIST=""
    while :
    do
	LIST=$(ls /dev/disk/by-label/); echo "First List: $LIST"
	NEW=$LIST; echo "New List Init: $NEW"
	for disk in "$PLIST"
	do
	    NEW=${NEW/"$disk"/""}; echo "New List Now: $NEW" # remove old entries from -to mount- list
	done
	PLIST=$LIST; echo "Prev List Now: $PLIST"
	for disk in "$NEW"
	do
	    if ls -d "/media/$(echo -e $disk)"
	    then
		continue
	    else
		ratpoison -c "echo $(udisks --mount /dev/disk/by-label/$disk)"
	    fi
	done
	sleep 1
    done
fi
