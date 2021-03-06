#!/bin/bash
NOWT=$(date +"%Y%m%d%H%M%S")

 case $1 in
    start)
       sleep 3;
       cd /home/pi/openepg/;
       echo $$ > /home/pi/importer.pid;
       exec 2>&1 make NODE=/usr/bin/node serve_importer 1>/home/pi/importer-$NOWT.out;
       ;;
     stop)  
       GPID=$(cat /home/pi/importer.pid);
       for PID in $(pstree -pn $GPID |grep -o "([[:digit:]]*)" |grep -o "[[:digit:]]*")
       do
           kill -9 $PID;
       done;
       rm /home/pi/importer.pid;
       ;;
     *)  
       echo "usage: importer.sh {start|stop}" ;;
 esac
 exit 0