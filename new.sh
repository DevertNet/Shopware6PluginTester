#!/bin/bash

set -e
args=("$@")

# Init Variables
SW_VERSION=
SW_SHORT_VERSION=
DIR=
DDEV_PATH=
SW_PATH=

checkArgumentsAndSetVariables() {
    SW_VERSION=${args[0]}
    SW_SHORT_VERSION=${SW_VERSION//./}
    SW_URL=https://sw${SW_SHORT_VERSION}.ddev.site

    if [ -z "$SW_VERSION" ]; then
        echo "Version parameter is missing e.g. ./run.sh 6.1.4"
        exit;
    fi

    # get aboslute path of plugintester dir
    #DIR=$(dirname ${args[0]}/..) ;
    DIR=$(pwd);

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
        cd $DDEV_PATH && ddev config --project-name=sw$SW_SHORT_VERSION --create-docroot --docroot=htdocs/public --project-type=php --webserver-type=apache-fpm --mutagen-enabled --composer-version=2
    fi

    # Start DDEV
    cd $DDEV_PATH && ddev start
}

launchShopware() {
    # Launch Shopware
    if [ -d "$DDEV_PATH/tmp-launch-shopware" ]; then
        rm -rf $DDEV_PATH/tmp-launch-shopware
    fi
    cp -R $DIR/dev-ops/launch-shopware $DDEV_PATH/tmp-launch-shopware

    # Run Launch Script Inside Docker Container
    cd $DDEV_PATH && ddev exec ./tmp-launch-shopware/launch-shopware.sh $SW_VERSION $SW_URL /var/www/html/htdocs
}

printInfos() {
    cd $DDEV_PATH && ddev describe
}

# Run
checkArgumentsAndSetVariables
createAndStartDdev
launchShopware
printInfos












#$DIR/dev-ops/launch-shopware-1-clone.sh $SW_VERSION $SW_PATH




# Launch Part 2 (Prepare)
#$DIR/dev-ops/launch-shopware-2-prepare.sh $SW_PATH


# cp $DIR/dev-ops/launch-shopware/.ddev/dump.sql $SW_PATH/.ddev/dump.sql
# mkdir $SW_PATH/.ddev/nginx_full
# cp $DIR/dev-ops/launch-shopware/.ddev/nginx-site.conf $SW_PATH/.ddev/nginx_full/nginx-site.conf
# cp $DIR/dev-ops/launch-shopware/.env.plugintester $SW_PATH/.env.plugintester
# cp $DIR/dev-ops/launch-shopware/jwt/private.pem $SW_PATH/config/jwt/private.pem
# cp $DIR/dev-ops/launch-shopware/jwt/public.pem $SW_PATH/config/jwt/public.pem
# touch $SW_PATH/install.lock

