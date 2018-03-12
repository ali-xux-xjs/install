#!/usr/bin/env bash

# APP中升级所有的包到最新版本以及初始化shell命令脚本

killall node
rm -rf ./package-lock.json ./npm-debug.log ./yarn.lock ./yarn-error.log
rm -rf ./node_modules
yarn install

echo "#!/bin/bash" >  ./cmd_upgrade.sh
echo "if [ ! -e \"./node_modules\" ]; then" >> ./cmd_upgrade.sh
echo "    yarn run upgrade; exit 0;" >> ./cmd_upgrade.sh
echo "fi" >> ./cmd_upgrade.sh
echo "./node_modules/@ali/axjs/cmd_upgrade.sh" >> ./cmd_upgrade.sh
echo "#!/bin/bash" >  ./cmd_make.sh
echo "./node_modules/@ali/axjs/cmd_make.sh" >> ./cmd_make.sh
echo "#!/bin/bash" >  ./cmd_debug.sh
echo "if [ \"\$1\" == \"x\" ]; then" >> ./cmd_debug.sh
echo "    killall node; exit 0;" >> ./cmd_debug.sh
echo "fi" >> ./cmd_debug.sh
echo "./node_modules/@ali/axjs/cmd_debug_app.sh $1" >> ./cmd_debug.sh
echo "#!/bin/bash" >  ./cmd_publish.sh
echo "./node_modules/@ali/axjs/cmd_publish.sh" >> ./cmd_publish.sh
chmod +x ./cmd_upgrade.sh ./cmd_make.sh ./cmd_debug.sh ./cmd_publish.sh
