#!/bin/bash

# get aboslute path of plugintester dir
DIR=$(dirname $0) ;
cd $DIR;
DIR=$(pwd);

#$DIR/dev-ops/launch-shopware.sh $DIR 6.1.3
$DIR/dev-ops/run-cypress.sh $DIR https://sw613.ddev.site/