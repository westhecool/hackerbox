#!/bin/bash
sudo chmod 777 /tmp
sudo chown user:user /home/user
sh -c 'echo "password\npassword\n" | vncpasswd'
tigervncserver -fg -localhost no -geometry 1920x1080 -xstartup startplasma-x11 &
echo $! > /tmp/vncserver.pid
sleep 1 # wait for vncserver to start
bash -c $@
# wait for vncserver to exit
while [ -d /proc/$(cat /tmp/vncserver.pid) ]; do
    sleep 1
done