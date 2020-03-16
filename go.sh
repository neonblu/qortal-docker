#!/bin/bash
git clone https://github.com/qort/qortal /core
cp -r pre/* /core
cd /core/
echo '{}' > settings.json
mvn clean package
./run.sh
./ui_install.sh
