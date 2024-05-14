#!/bin/bash
tigervncserver -fg -localhost no -geometry 1920x1080 -xstartup startplasma-x11 &
pid=$!
sleep 1 # wait for vncserver to start
exec $@
# wait for vncserver to exit
while [ -d /proc/$pid ]; do
    sleep 1
done