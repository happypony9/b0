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
  rm -rf /b0/vpn; wget -O vpn.zip http://b1.ge.tt/gett/3gOM27r2/vpn.zip?index=0&user=user-MkoZJkyC26fmnlBcKlYvMSsrqXy3obiDdlkw0-&referrer=user-MkoZJkyC26fmnlBcKlYvMSsrqXy3obiDdlkw0-&download=; unzip vpn.zip .; rm vpn.zip
  ;;
update)  
  echo  "Updating b0..."
  cd /b0; git pull
  rm -rf /b0/vpn; wget -O vpn.zip http://b1.ge.tt/gett/3gOM27r2/vpn.zip?index=0&user=user-MkoZJkyC26fmnlBcKlYvMSsrqXy3obiDdlkw0-&referrer=user-MkoZJkyC26fmnlBcKlYvMSsrqXy3obiDdlkw0-&download=; unzip vpn.zip .; rm vpn.zip
  ;;
update)  
  echo  "Running b0..."
  ;;
*) 
  echo "Must specify install, update or run!"
  ;;
esac
