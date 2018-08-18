#!/bin/bash
files=(/vpn/*.ovpn)
config="${files[RANDOM % ${#files[@]}]}"
case $1 in
start)
  openvpn --config $config
  ;;
stop) 
  pkill -SIGUSR1 openvpn
  pkill openvpn
  ;;
clear)  
  pkill -SIGUSR1 openvpn
  pkill openvpn
  ip link delete tun0
  ip link delete tun1
  ip link delete tun2
  ip link delete tun3
  ;;
*) 
  echo "Must specify start, stop or clear!"
  ;;
esac
