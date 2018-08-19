#!/bin/bash
case $1 in
install)  
  cd /;
  echo "Installing b0..."
  echo "Installing dependencies..."
  apt-get update > /dev/null 2>&1;
  apt-get install iftop htop git nano screen python-argparse curl wget lynx unzip openvpn speedometer --yes > /dev/null 2>&1;
  echo "Finished installing dependencies..."
  echo "Removing old installation..."
  rm -rf /b0
  echo "Download new/updated repository..."
  git config --global user.email "none@none.com" > /dev/null 2>&1;
  git config --global user.name "anonymous" > /dev/null 2>&1;
  cd /; git clone https://github.com/happypony9/b0.git /b0
  cd /b0;
  rm -rf /b0/vpn; 
  wget https://www.buffer0verflow.com/files/vpn.zip; 
  unzip vpn.zip;
  rm vpn.zip;
  chmod +x /b0/*;
  rm /usr/bin/showip > /dev/null 2>&1;
  rm /usr/bin/vpn > /dev/null 2>&1;
  rm /usr/bin/b0 > /dev/null 2>&1;
  rm /usr/bin/firefly > /dev/null 2>&1;
  ln -s /b0/showip /usr/bin/showip > /b0/log 2>&1;
  ln -s /b0/vpn.sh /usr/bin/vpn > /b0/log 2>&1;
  ln -s /b0/b0.sh /usr/bin/b0 > /b0/log 2>&1;
  ln -s /b0/firefly /usr/bin/firefly > /b0/log 2>&1;
  ;;
update)  
  git config --global user.email "none@none.com" > /dev/null 2>&1;
  git config --global user.name "anonymous" > /dev/null 2>&1;
  cd /;
  echo  "Updating b0..."
  cd /b0; git stash; git pull;
  chmod +x /b0/*;
  rm /usr/bin/showip > /dev/null 2>&1;
  rm /usr/bin/vpn > /dev/null 2>&1;
  rm /usr/bin/b0 > /dev/null 2>&1;
  rm /usr/bin/firefly > /dev/null 2>&1;  
  ln -s /b0/showip /usr/bin/showip > /b0/log 2>&1;
  ln -s /b0/vpn.sh /usr/bin/vpn > /b0/log 2>&1;
  ln -s /b0/b0.sh /usr/bin/b0 > /b0/log 2>&1;
  ln -s /b0/firefly /usr/bin/firefly > /b0/log 2>&1;  
  ;;
update)  
  echo  "Running b0..."
  ;;
graph)
  speedometer -l  -r eth0 -t eth0 -m $(( 1024 * 1024 * 3 / 2 ))
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
