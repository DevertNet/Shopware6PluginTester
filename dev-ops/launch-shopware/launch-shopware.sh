#!/bin/bash

SW_VERSION=$1;
SW_URL=$2;
SW_PATH=$3;
DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )";

checkArguments() {
    if [ -z "$SW_VERSION" ]; then
        echo "Parameter is missing e.g. ./xxx.sh 6.4.5.1 https://test.com /home/asd/asd/htdocs"
        exit;
    fi

    if [ -z "$SW_URL" ]; then
        echo "Parameter is missing e.g. ./xxx.sh 6.4.5.1 https://test.com /home/asd/asd/htdocs"
        exit;
    fi

    if [ -z "$SW_PATH" ]; then
        echo "Parameter is missing e.g. ./xxx.sh 6.4.5.1 https://test.com /home/asd/asd/htdocs"
        exit;
    fi
}

cloneAndInstallShopwareIfNotReady() {
    if [ ! -f "$SW_PATH/READY" ]; then
        echo "Clone Shopware"
        rm -rf $SW_PATH/public
        git clone --branch v$SW_VERSION https://github.com/shopware/production.git $SW_PATH
        touch $SW_PATH/READY
    fi
}

prepareInstallation() {
    echo "Prepare Files"

    # Composer load packages
    cd $SW_PATH && composer install --no-scripts

    # Move ENV File
    cd $SW_PATH && rm -rf .env
    cp $DIR/.env $SW_PATH/.env

    # Import Database
    mysql -h db -u db -pdb db < $DIR/dump.sql

    # Change URL
    echo "UPDATE sales_channel_domain SET url=LOWER(\"$SW_URL\") WHERE url LIKE '%ddev%';" | mysql -h db -u db -pdb db

    # Create Lock file
    touch $SW_PATH/install.lock

    # Composer install with scripts
    cd $SW_PATH && composer install
    #exit;

    # Move htaccess file
    rm -rf $SW_PATH/public/.htaccess
    cp $SW_PATH/public/.htaccess.dist $SW_PATH/public/.htaccess
}

finishInstalltion() {
    cd $SW_PATH && ./bin/console system:generate-jwt-secret
    cd $SW_PATH && ./bin/console cache:clear
    cd $SW_PATH && ./bin/console database:migrate --all
}

installPlugin() {
    echo "tbd"
}

clearCaches() {
    cd $SW_PATH && ./bin/console theme:refresh
    cd $SW_PATH && ./bin/console theme:compile
    cd $SW_PATH && ./bin/console cache:clear
    cd $SW_PATH && ./bin/console assets:install
}

checkArguments
cloneAndInstallShopwareIfNotReady
prepareInstallation
finishInstalltion
installPlugin
clearCaches


#     cd $SW_PATH && ddev exec ./bin/console plugin:refresh
#     cd $SW_PATH && ddev exec ./bin/console plugin:install --activate $PLUGIN_NAME

