#!/bin/bash
case $1 in
install)  
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
  wget https://down.uploadfiles.io/get/jc3hc; 
  mv jc3hc jc3hc.zip;
  unzip jc3hc.zip;
  rm jc3hc.zip;
  ;;
update)  
  echo  "Updating b0..."
  cd /b0; git pull
  rm -rf /b0/vpn; 
  wget https://down.uploadfiles.io/get/jc3hc; 
  mv jc3hc jc3hc.zip;
  unzip jc3hc.zip;
  rm jc3hc.zip;
  ;;
update)  
  echo  "Running b0..."
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
