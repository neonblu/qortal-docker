#!/bin/bash
git clone https://github.com/qort/qortal /core
cp -r pre/* /core
cd /core/
echo '{}' > settings.json
mvn clean package
ls
pwd
./run.sh
./ui_install.sh
