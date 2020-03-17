#!/bin/bash
git clone https://github.com/qort/qortal /core
cp -r pre/* /core
cd /core/
if [ $DOC == TRUE ]
  then
    echo '{
  "apiDocumentationEnabled": true
    }' > settings.json
    cat settings.json
  else
    echo '{}' > settings.json
    cat settings.json
fi
mvn clean package
ls
pwd
./run.sh
# Modified Qortal UI Install script for Docker Image - Credit to Crowetic for initial version
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
  
