#!/bin/sh

LOG="/var/log/cs183/uptime.log"
FILE="/root/lab2-test"
currTime=$(date +"%m-%d-%Y %H:%M:%S")

if [ -f $LOG ];then
  ##echo "log exists" ##LOG EXISTS
  LW=$(tac $LOG | awk 'NF{print $NF; exit}') ##READ IN LAST WORD TO VARIABLE LW
  
  if [ -f $FILE ];then
    ##echo "file found"      ##FILE FOUND
    if [ "$LW" != "found" ];then
      echo $currTime" - FILE \""$FILE"\" has been found" >> $LOG
    fi
  else 
    ##echo "file lost"      ##FILE LOST
    if [ $LW != "lost" ];then
      echo $currTime" - FILE \""$FILE"\" has been lost" >> $LOG
    fi
  fi
else
  ##echo "log does not exist"  ##LOG DOES NOT EXIST
  if [ -f $FILE ];then
    ##FILE FOUND - CREATE LOG
    ##echo "file found - creating log"
    touch $LOG
    echo $currTime" - FILE \""$FILE"\" has been found" >> $LOG
  ##else
    ##FILE LOST - DO NOT CREATE FILE
    ##IF FILE IS NOT FOUND, NO LOG NEEDS TO BE CREATED.
  fi
fi
