#!/bin/sh

group_name=""
while IFS=: read -r user_name b uid gid e f g
do
  while IFS=: read -r group_name2 b2 gid2 g2
  do
    if [ $gid -eq $gid2 ]
    then
      group_name=$group_name2
    fi
  done < /etc/group
  echo $user_name $uid $group_name

done < /etc/passwd
