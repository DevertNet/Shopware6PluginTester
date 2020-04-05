#!/bin/bash

set -e

SW_VERSION=$1
SW_SHORT_VERSION=${SW_VERSION//./}

if [ -z "$SW_VERSION" ]; then
    echo "Version parameter is missing e.g. ./tools/shopware-downloader.sh 6.1.4"
fi

# get aboslute path of plugintester dir
DIR=$(dirname $0/..) ;
DIR=$(pwd);

SW_PATH=$DIR/shopware/$SW_VERSION

#echo $DIR
#echo $SW_PATH

# Clone SW
git clone --branch v$SW_VERSION https://github.com/shopware/production.git $SW_PATH
rm -rf $SW_PATH/.git

#Setup DDEV
cd $SW_PATH && ddev config --project-name=sw$SW_SHORT_VERSION --docroot=public --project-type=php
cp $DIR/dev-ops/launch-shopware/.ddev/dump.sql $SW_PATH/.ddev/dump.sql
cp $DIR/dev-ops/launch-shopware/.ddev/nginx-site.conf $SW_PATH/.ddev/nginx-site.conf
cp $DIR/dev-ops/launch-shopware/.env.plugintester $SW_PATH/.env.plugintester
cp $DIR/dev-ops/launch-shopware/jwt/private.pem $SW_PATH/config/jwt/private.pem
cp $DIR/dev-ops/launch-shopware/jwt/public.pem $SW_PATH/config/jwt/public.pem
touch $SW_PATH/install.lock

# Launch Shopware & Upgrade Database
cd $SW_PATH && composer install
cd $SW_PATH && cp .env.plugintester .env
cd $SW_PATH && ddev start
cd $SW_PATH && ddev import-db --src=.ddev/dump.sql
cd $SW_PATH && ddev exec ./bin/console cache:clear
cd $SW_PATH && ddev exec ./bin/console plugin:refresh
cd $SW_PATH && ddev exec ./bin/console database:migrate --all core
cd $SW_PATH && ddev exec ./bin/console dal:refresh:index
cd $SW_PATH && ddev exec ./bin/console scheduled-task:register
cd $SW_PATH && ddev exec ./bin/console theme:refresh
cd $SW_PATH && ddev exec ./bin/console theme:compile
cd $SW_PATH && echo "UPDATE sales_channel_domain SET url=\"https://sw${SW_SHORT_VERSION}.ddev.site\";" | ddev mysql
cd $SW_PATH && ddev exec ./bin/console assets:install
cd $SW_PATH && ddev exec ./bin/console theme:compile
cd $SW_PATH && ddev exec ./bin/console cache:clear
cd $SW_PATH && ddev export-db --gzip=false > .ddev/dump.sql
cd $SW_PATH && ddev describe