#!/bin/bash

PLUGIN_PATH=$3

cd $1 && ./node_modules/cypress/bin/cypress run --config baseUrl="${2}" --project $PLUGIN_PATH