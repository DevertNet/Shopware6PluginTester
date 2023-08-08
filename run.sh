#!/bin/bash

set -e
args=("$@")

# Init Variables
SW_VERSION=
SW_SHORT_VERSION=
DIR=
DDEV_PATH=
SW_PATH=
PLUGIN_PATH=
PLUGIN_NAME=

checkArgumentsAndSetVariables() {
    SW_VERSION=${args[0]}
    PLUGIN_PATH=${args[1]}

    if [ -z "$SW_VERSION" ]; then
        echo "Parameter is missing e.g. ./run.sh 6.4.6.0 /path/to/YourPlugin"
        exit;
    fi

    if [ -z "$PLUGIN_PATH" ]; then
        echo "Parameter is missing e.g. ./run.sh 6.4.6.0 /path/to/YourPlugin"
        exit;
    fi

    # get aboslute path of plugintester dir
    #DIR=$(dirname ${args[0]}/..) ;
    DIR=$(pwd);

    # Generated Variables
    SW_SHORT_VERSION=${SW_VERSION//./}
    SW_URL=https://sw${SW_SHORT_VERSION}.ddev.site
    PLUGIN_NAME="$( basename $PLUGIN_PATH )";
    DDEV_PATH=$DIR/shopware/$SW_VERSION
    SW_PATH=$DIR/shopware/$SW_VERSION/htdocs
}

createAndStartDdev() {
    # Create DDEV container if installation is not ready
    if [ ! -f "$SW_PATH/READY" ]; then
        # Remove DDEV Container and folder
        if [ -d "$DDEV_PATH" ]; then
            echo 'Installation not ready. Remove ddev container.'

            if ddev list | grep "sw$SW_SHORT_VERSION"; then
                cd $DDEV_PATH && ddev stop --unlist sw$SW_SHORT_VERSION
            fi

            rm -rf $DDEV_PATH
        fi

        # Create folder and init DDEV
        mkdir -p $DDEV_PATH
        cd $DDEV_PATH && ddev config --project-name=sw$SW_SHORT_VERSION --php-version=8.1 --create-docroot --docroot=htdocs/public --project-type=php --webserver-type=apache-fpm --composer-version=2
    fi

    # Start DDEV
    cd $DDEV_PATH && ddev start
}

copyPlugin() {
    rm -rf $DDEV_PATH/$PLUGIN_NAME
    cp -R $PLUGIN_PATH $DDEV_PATH/$PLUGIN_NAME
}

launchShopware() {
    # Launch Shopware
    if [ -d "$DDEV_PATH/tmp-launch-shopware" ]; then
        rm -rf $DDEV_PATH/tmp-launch-shopware
    fi
    cp -R $DIR/dev-ops/launch-shopware $DDEV_PATH/tmp-launch-shopware

    # Run Launch Script Inside Docker Container
    cd $DDEV_PATH && ddev exec ./tmp-launch-shopware/launch-shopware.sh $SW_VERSION $SW_URL /var/www/html/htdocs /var/www/html/$PLUGIN_NAME
}

enableMutagen() {
    if [ -f "$SW_PATH/READY" ]; then
        if cd $DDEV_PATH && cat .ddev/config.yaml | grep 'mutagen_enabled: true'; then
            echo DDEV: mutagen_enabled = true
        else
            echo DDEV: mutagen_enabled = false ... Enable it...
            cd $DDEV_PATH && ddev stop
            cd $DDEV_PATH && ddev config --mutagen-enabled=true
            cd $DDEV_PATH && ddev start
        fi
    fi
}

printInfos() {
    cd $DDEV_PATH && ddev describe
}

runCypress() {
    MYSQL_PORT=$(cd $DDEV_PATH && ddev describe | grep 'db' | grep 'localhost' | cut -d':' -f3 | cut -d' ' -f1)
    MYSQL_COMMAND="mysql -h 127.0.0.1 --port=$MYSQL_PORT -u db -pdb db"
    cd $DIR && ./node_modules/cypress/bin/cypress open --config baseUrl="$SW_URL" --project $PLUGIN_PATH --env SW_PATH=$SW_PATH,MYSQL_COMMAND="$MYSQL_COMMAND"
}

# Run
checkArgumentsAndSetVariables
createAndStartDdev
copyPlugin
launchShopware
enableMutagen
printInfos
runCypress
