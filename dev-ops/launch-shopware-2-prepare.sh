#!/bin/bash

SW_PATH=$1;
DIR=$(pwd);

if [ -z "$SW_PATH" ]; then
    echo "Installation path parameter is missing e.g. ./xxx.sh /home/asd/asd/htdocs"
    exit;
fi
