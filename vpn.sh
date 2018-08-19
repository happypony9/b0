#!/bin/bash
files=(/b0/vpn/*.ovpn)
config="${files[RANDOM % ${#files[@]}]}"
case $1 in
start)
  sudo vpn clear > /b0/log 2>&1;
  sudo /b0/keep.ssh > /b0/log 2>&1;
  sudo pkill -9 openvpn > /b0/log 2>&1;
  sudo screen -dmS vpn openvpn --config $config > /b0/log 2>&1;
  ;;
stop) 
  sudo /b0/keep.ssh > /b0/log 2>&1;
  sudo pkill -9 openvpn > /b0/log 2>&1;
  ;;
restart)
  sudo vpn clear > /b0/log 2>&1;
  sudo /b0/keep.ssh > /b0/log 2>&1;
  sudo pkill -9 openvpn > /b0/log 2>&1;
  sudo screen -dmS vpn openvpn --config $config > /b0/log 2>&1;
  ;;
clear)  
  sudo /b0/keep.ssh > /b0/log 2>&1;
  sudo pkill -9 openvpn > /b0/log 2>&1;
  ;;
*) 
  echo "Must specify start, stop, restart, or clear!"
  ;;
esac
