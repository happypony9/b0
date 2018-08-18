#!/bin/bash
case $1 in
install)  
  git config --global user.email "none@none.com"
  git config --global user.name "anonymous"
  cd /;
  echo "Installing b0..."
  echo "Installing dependencies..."
  apt-get update;
  apt-get install iftop htop git nano screen python-argparse curl wget lynx unzip openvpn --yes
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
  chmod +x /b0/*;
  ln -s /b0/showip /usr/bin/showip > /b0/log 2>&1;
  ln -s /b0/vpn.sh /usr/bin/vpn > /b0/log 2>&1;
  ln -s /b0/b0.sh /usr/bin/b0 > /b0/log 2>&1;
  ln -s /b0/firefly /usr/bin/firefly > /b0/log 2>&1;
  ;;
update)  
  git config --global user.email "none@none.com"
  git config --global user.name "anonymous"
  cd /;
  echo  "Updating b0..."
  cd /b0; git stash; git pull;
  chmod +x /b0/*;
  ln -s /b0/showip /usr/bin/showip > /b0/log 2>&1;
  ln -s /b0/vpn.sh /usr/bin/vpn > /b0/log 2>&1;
  ln -s /b0/b0.sh /usr/bin/b0 > /b0/log 2>&1;
  ln -s /b0/firefly /usr/bin/firefly > /b0/log 2>&1;  
  ;;
update)  
  echo  "Running b0..."
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
