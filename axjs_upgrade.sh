#!/usr/bin/env bash

killall node
rm -rf ./package-lock.json ./yarn.lock ./yarn-error.log
rm -rf ./node_modules
yarn install

echo "#!/bin/bash" >  ./cmd_upgrade.sh
echo "./node_modules/@ali/axjs/cmd_upgrade.sh" >> ./cmd_upgrade.sh
echo "#!/bin/bash" >  ./cmd_make.sh
echo "./node_modules/@ali/axjs/cmd_make.sh" >> ./cmd_make.sh
echo "#!/bin/bash" >  ./cmd_debug.sh
echo "./node_modules/@ali/axjs/cmd_debug.sh" >> ./cmd_debug.sh
echo "#!/bin/bash" >  ./cmd_publish.sh
echo "./node_modules/@ali/axjs/cmd_publish.sh" >> ./cmd_publish.sh
chmod +x ./cmd_upgrade.sh ./cmd_make.sh ./cmd_debug.sh ./cmd_publish.sh
