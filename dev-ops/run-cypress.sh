#!/bin/bash

PLUGIN_PATH=$3
CY_MODE=$4
SW_PATH=$5

cd $1 && ./node_modules/cypress/bin/cypress $CY_MODE --config baseUrl="${2}" --project $PLUGIN_PATH --env SW_PATH=$SW_PATH