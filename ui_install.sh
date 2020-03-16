#!/bin/bash
# Modified Qortal UI Install script for Docker Image - Credit to Crowetic for initial version
  echo -e '---DOING APT UPDATE FIRST---'
  
  sudo apt update
  
  echo -e '--SETTING UP YARN AND NODE APT SOURCES AND INSTALLING DEPENDENCIES FOR NODE ATTEMPT ONE---'
  
  sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo -e "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list  
  curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

  echo -e '---INSTALLING NODEJS 12+ SOURCES WITH TWO POSSIBLE OPTIONS IN CASE OF FAILURE OF ONE---'
  
  sudo echo "deb https://deb.nodesource.com/node_12.x eoan main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  sudo echo 'deb-src https://deb.nodesource.com/node_12.x eoan main' >> /etc/apt/sources.list.d/nodesource.list
  sudo apt update
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  
  echo -e '---INSTALLING DEPENDENCIES!---'
  
  sudo apt update  
  sudo apt -y install nodejs yarn npm zip unzip

  echo -e '---CLONING ALL UI REPOSITORIES---'
  
  sudo git clone https://github.com/QORT/qortal-ui && sudo git clone https://github.com/QORT/frag-default-plugins && sudo git clone https://github.com/QORT/frag-core && sudo git clone https://github.com/QORT/frag-qortal-crypto
  
  echo -e '---EXECUTING ALL PRE-BUILD TASKS---'
  
  cd frag-core 
  sudo yarn install 
  sudo yarn unlink 
  sudo yarn link 
  cd ../frag-default-plugins
  sudo yarn install 
  sudo yarn unlink 
  sudo yarn link
  cd ../frag-qortal-crypto
  sudo yarn install 
  sudo yarn unlink 
  sudo yarn link
  cd ../qortal-ui 
  sudo yarn link @frag-crypto/frag-core 
  sudo yarn link @frag-crypto/frag-default-plugins 
  sudo yarn link @frag-crypto/frag-qortal-crypto
  
  echo -e '---BUILDING UI SERVER THEN RUNNING IN THIS TERMINAL WINDOW - KEEP WINDOW OPEN!---'
  
  sudo yarn run build 
  
  echo -e '---RUNNING UI SERVER - ACCESS VIA - http://localhost:12388 - KEEP THIS WINDOW OPEN AS LONG AS YOU ARE PLANNING TO USE UI---' 
  
  sudo yarn run server
  