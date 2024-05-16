#!/bin/bash
sudo chmod 777 /tmp
sudo chown user:user /home/user
# set passwords
if [ -z "$rootpassword" ]; then
    rootpassword=password
fi
if [ -z "$userpassword" ]; then
    userpassword=password
fi
if [ -z "$vncpassword" ]; then
    vncpassword=password
fi
sh -c 'echo "$vncpassword\n$vncpassword\n" | vncpasswd'
sudo sh -c 'echo "$rootpassword\n$rootpassword" | passwd root'
sudo sh -c 'echo "$userpassword\n$userpassword" | passwd user'
tigervncserver -fg -localhost no -geometry 1920x1080 -xstartup startplasma-x11 &
echo $! > /tmp/vncserver.pid
sleep 1 # wait for vncserver to start
bash -c $@
# wait for vncserver to exit
while [ -d /proc/$(cat /tmp/vncserver.pid) ]; do
    sleep 1
done