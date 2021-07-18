#!/bin/bash

DIR=$1
SW_PATH=$1/shopware/$2;
PLUGIN_NAME=$3

# Launch Shopware
cd $SW_PATH && ddev stop
cd $SW_PATH && ddev start
cd $SW_PATH && rm -rf .env
cd $SW_PATH && ddev composer install
cd $SW_PATH && cp .env.plugintester .env
rm -rf $SW_PATH/config/jwt/private.pem
cp $DIR/dev-ops/launch-shopware/jwt/private.pem $SW_PATH/config/jwt/private.pem
rm -rf $SW_PATH/config/jwt/public.pem
cp $DIR/dev-ops/launch-shopware/jwt/public.pem $SW_PATH/config/jwt/public.pem
cd $SW_PATH && ddev import-db --src=.ddev/dump.sql
cd $SW_PATH && ddev exec ./bin/console cache:clear
cd $SW_PATH && ddev exec ./bin/console assets:install
cd $SW_PATH && ddev exec ./bin/console database:migrate --all

if [ $PLUGIN_NAME != "no" ]; then
    # Activate plugin
    cd $SW_PATH && ddev exec ./bin/console plugin:refresh
    cd $SW_PATH && ddev exec ./bin/console plugin:install --activate $PLUGIN_NAME
    cd $SW_PATH && ddev exec ./bin/console theme:refresh
    cd $SW_PATH && ddev exec ./bin/console theme:compile
    cd $SW_PATH && ddev exec ./bin/console cache:clear
fi

# Print URLs
cd $SW_PATH && ddev describe