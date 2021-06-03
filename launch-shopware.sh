#!/bin/bash

set -e

# get aboslute path of plugintester dir
DIR=$(dirname $0) ;
cd $DIR;
DIR=$(pwd);

SHOPWARE_VERSION=$1

if [ -z "$SHOPWARE_VERSION" ]; then
    echo "Parameter missing. Usage: Fire ./launch-shopware.sh 6.4.0.0"
    exit;
fi

$DIR/dev-ops/launch-shopware.sh $DIR $SHOPWARE_VERSION no