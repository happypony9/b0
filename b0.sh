#!/bin/bash
case $1 in
install)  
  cd /;
  echo "Installing b0..."
  echo "Installing dependencies..."
  apt-get install git nano screen python-argparse curl wget lynx unzip openvpn --yes
  echo "Finished installing dependencies..."
  echo "Removing old installation..."
  rm -rf /b0
  echo "Download new/updated repository..."
  cd /; git clone https://github.com/happypony9/b0.git /b0
  cd /b0;
  rm -rf /b0/vpn; 
  wget https://www.buffer0verflow.com/files/vpn.zip; 
  unzip vpn.zip;
  rm vpn.zip;
  
  chmod +x /b0/*.sh;
  ;;
update)  
  cd /;
  echo  "Updating b0..."
  cd /b0; git stash; git pull;
  rm -rf /b0/vpn; 
  wget https://www.buffer0verflow.com/files/vpn.zip; 
  unzip vpn.zip;
  rm vpn.zip;
  
  chmod +x /b0/*.sh;
  ;;
update)  
  echo  "Running b0..."
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
