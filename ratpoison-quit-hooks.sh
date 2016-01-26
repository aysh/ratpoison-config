#!/usr/bin/sh

killall wallpaper.sh
killall mailcheck.sh
killall fsautomount.sh

exec /home/aysh/fsautomount.sh
#for pid in $(ps -e|grep wallpaper.sh|awk '{print $1}');
#do
#    kill $pid
#    echo $pid
#done
#for pid in $(ps -e|grep mailcheck.sh|awk '{print $1}');
#do
#    kill $pid
#    echo $pid
#done
