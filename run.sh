#!/bin/bash

set -e

# get aboslute path of plugintester dir
DIR=$(dirname $0) ;
cd $DIR;
DIR=$(pwd);

PLUGIN_PATH=$1
PLUGIN_NAME=$2
TESTER_MODE=$3

if [ -z "$PLUGIN_PATH" ]; then
    echo "Parameter missing. Usage: Fire ./run.sh /path/to/your/plugin/ YourPluginName"
fi

if [ -z "$PLUGIN_NAME" ]; then
    echo "Parameter missing. Usage: Fire ./run.sh /path/to/your/plugin/ YourPluginName"
fi

if [ -z "$TESTER_MODE" ]; then
    echo "Missing TESTER_MODE. Set it to 'all'"
    TESTER_MODE='all'
fi

echo $TESTER_MODE

SHOPWARE_VERSIONS=(6.1.3 6.1.4)

# Launch & run Shopware Versions
for i in "${SHOPWARE_VERSIONS[@]}"
do
   : 
    SHOPWARE_VERSION=$i
    SW_SHORT_VERSION=${i//./}

    # Copy Plugin & Launch Shopware
    if [ $TESTER_MODE == "all" ]; then  
        $DIR/dev-ops/copy-plugin.sh $DIR $SHOPWARE_VERSION $PLUGIN_PATH $PLUGIN_NAME
        $DIR/dev-ops/launch-shopware.sh $DIR $SHOPWARE_VERSION $PLUGIN_NAME
    fi

    # Run Cypress Test
    $DIR/dev-ops/run-cypress.sh $DIR https://sw$SW_SHORT_VERSION.ddev.site/ $PLUGIN_PATH
done
