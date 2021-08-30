#!/bin/bash

echo "============="
echo -n "System will be powered off in how many seconds: "
read time

echo "turning off in $time seconds, notification every 15sec"
remainder=$(( time % 15 ))
#echo "remainder = $remainder "
xtoloop=$(( $((time - remainder)) / 15 ))

counter=1

#echo "counter = $counter, xtoloop = $xtoloop"
while [ $counter -le $(( xtoloop - 1 )) ]
do
   notify-send "turning off in $time seconds"
   sleep 15
   counter=$(( $counter + 1 ))
   time=$(( $time - 15 ))
done

notify-send "turning off in $time seconds"
#echo "15sec + $remainder sec, to poweroff"

while [ $time -ge 0 ]
do
   if [ $time -eq 15 ] || [ $time -eq 10 ] || [ $time -eq 5 ] || [ $time -eq 2 ]
   then
      notify-send "turning off in $time seconds"
   fi
   time=$(( $time - 1 ))
   sleep 1
done

: '
Multiple Lines Comment
'

#shutdown -h -P now
#echo poweroff
poweroff
