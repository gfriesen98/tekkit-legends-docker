#!/bin/bash

echo $SERVER_OP > /minecraft/ops.txt
echo "eula=true" > /minecraft/eula.txt
tmux new-session -d -s tekkit "java $JAVA_ARGS -jar TekkitLegends.jar nogui"
sleep 2
tail -f /minecraft/logs/latest.log