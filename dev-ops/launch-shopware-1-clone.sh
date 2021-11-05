#!/bin/bash

SW_VERSION=$1;
SW_PATH=$2;

if [ -z "$SW_VERSION" ]; then
    echo "Installation path parameter is missing e.g. ./xxx.sh 6.4.5.1 /home/asd/asd/htdocs"
    exit;
fi

if [ -z "$SW_PATH" ]; then
    echo "Installation version parameter is missing e.g. ./xxx.sh 6.4.5.1 /home/asd/asd/htdocs"
    exit;
fi

# Reset Installation if first run was not finished
if [ ! -f "$SW_PATH/READY" ]; then
    echo 'Installation not ready. Remove old installation.'
    rm -rf $SW_PATH
    #git clone --branch v$SW_VERSION https://github.com/shopware/production.git $SW_PATH
    cp -R /Users/leon/htdocs/git/Shopware6PluginTester/cache/shopware/6.4.5.1 $SW_PATH
fi