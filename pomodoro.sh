#!/bin/bash
n=1
echo "==================== break time ==================" > ~/break.txt
while true; do
	echo $n >> ~/break.txt
	sleep 1500
	gedit ~/break.txt & 
	seconds=300; date1=$((`date +%s` + $seconds));
	while [ "$date1" -ge `date +%s` ]; do
  		echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r" > ~/break.txt;
	done
	killall gedit
	n=$((n +1))
done
