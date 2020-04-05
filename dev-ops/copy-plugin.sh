#!/bin/bash

SW_PATH=$1/shopware/$2;
PLUGIN_PATH=$3
PLUGIN_NAME=$4

echo $SW_PATH
echo $PLUGIN_PATH
echo $PLUGIN_NAME

# Remove other plugins
rm -rf $SW_PATH/custom/plugins
mkdir $SW_PATH/custom/plugins
#find $SW_PATH/custom/plugins -maxdepth 1 -type d ! -path "*SwagPlatformDemoData*"  ! -path "*SwagPayPal*"  ! -path "*plugins" -exec rm -rf {} +

#copy Plugin
cp -R $PLUGIN_PATH $SW_PATH/custom/plugins/$PLUGIN_NAME