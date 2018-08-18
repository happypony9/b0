#!/bin/bash
case $1 in
install)  
  echo "Installing b0..."
  echo "Installing dependencies..."
  apt-get install git nano screen python-argparse curl wget lynx unzip openvpn
  echo "Finished installing dependencies..."
  echo "Removing old installation..."
  rm -rf /b0
  echo "Download new/updated repository..."
  cd /; git clone https://github.com/happypony9/b0.git /b0
  ;;
update)  
  echo  "Updating b0..."
  cd /b0; git pull
  ;;
update)  
  echo  "Running b0..."
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
