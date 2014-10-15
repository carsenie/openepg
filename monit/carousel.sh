#!/bin/bash

 case $1 in
    start)
       sleep 3;
       cd /home/pi/openepg/;
       echo $$ > /home/pi/carouselpid;
       exec 2>&1 make NODE=/usr/bin/node serve_carousel 1>/home/pi/carousel.out;
       ;;
     stop)  
       kill -9 -`cat /home/pi/carousel.pid`;
       rm /home/pi/carousel.pid;
       ;;
     *)  
       echo "usage: carousel.sh {start|stop}" ;;
 esac
 exit 0