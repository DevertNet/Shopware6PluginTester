#!/bin/bash

cd $1 && ./node_modules/cypress/bin/cypress open --config baseUrl="${2}" --project ./..