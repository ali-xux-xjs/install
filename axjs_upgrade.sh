#!/usr/bin/env bash

killall node
rm -rf ./package-lock.json ./yarn.lock ./yarn-error.log
rm -rf ./node_modules
yarn install
