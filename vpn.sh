#!/bin/bash
files=(/b0/vpn/*.ovpn)
config="${files[RANDOM % ${#files[@]}]}"
case $1 in
start)
  sudo screen -dmS vpn openvpn --config $config > /b0/log 2>&1;
  ;;
stop) 
  pkill -9 openvpn > /b0/log 2>&1;
  ;;
restart)
  pkill -9 openvpn > /b0/log 2>&1;
  sudo screen -dmS vpn openvpn --config $config > /b0/log 2>&1;
  ;;
clear)  
  pkill -9 openvpn > /b0/log 2>&1;
  ip link delete tun0 > /b0/log 2>&1;
  ;;
*) 
  echo "Must specify start, stop, restart, or clear!"
  ;;
esac
