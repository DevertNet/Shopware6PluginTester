#!/bin/bash

echo $1
echo $2

cd $1 && ./node_modules/cypress/bin/cypress open --config baseUrl="${2}" --project ./..