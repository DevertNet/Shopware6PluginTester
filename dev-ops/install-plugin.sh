#!/bin/bash

# find /home/leon/htdocs/git/DevertAutoMetaDetails/PluginTester/shopware/6.1.3/custom/plugins -maxdepth 1 -type d ! -path "*SwagPlatformDemoData*"  ! -path "*SwagPayPal*"  ! -path "*plugins" -exec rm -rf {} +