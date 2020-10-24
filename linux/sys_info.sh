#!/bin/bash
OUTPUT =$HOME/research/sys_info.txt
IP=$(ip addr | head -9 | tail -1)
SUID=$(sudo find / -type f -perm /4000 2> /dev/null)
if [! -d /$HOME/research ]
then
        echo "research directory exists"
        echo "making directory"
        mkdir ~/research
fi


if [-f $OUTPUT ]
then
        rm $OUTPUT
fi 


name= "Jenn"
echo "Hello $name"
echo "A Quick System Audit Script" >> $OUTPUT
date >> $OUTPUT

echo $MACHTYPE >> $OUTPUT

echo -e "Uname info: $(uname -a) \n" >> $OUTPUT

echo -e "IP info: $IP \n" >> $OUTPUT
echo -e "Hostname: $HOSTNAME" >> $OUTPUT
echo -e "DNS Servers: " >> $OUTPUT
cat /etc/resolv.conf >> $OUTPUT
echo "Memory Info:" >> $OUTPUT
free -h >> $OUTPUT
echo -e "\nDisk Usage: " >> $OUTPUT
lscpu | grep CPU >> $OUTPUT
echo -e "\nDisk Usage: " >> $OUTPUT

df -H head -2 >> $OUTPUT

echo -e "\nWho is logged in: \n$(who) \n" >> $OUTPUT

echo " " >> $OUTPUT

echo "New Stuff Below" >> $OUTPUT

echo " " >> $OUTPUT
 

$SUID >> $OUTPUT
ps aux --sort -%mem | head | awk {'print $1, $2, $3, $4, $11'} >> $OUTPUT
