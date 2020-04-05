#!/bin/bash

SW_PATH=$1/shopware/$2;

cd $SW_PATH && rm -rf .env
cd $SW_PATH && composer install
cd $SW_PATH && cp .env.plugintester .env
cd $SW_PATH && ddev start
cd $SW_PATH && ddev import-db --src=.ddev/dump.sql
cd $SW_PATH && ddev exec ./bin/console cache:clear
cd $SW_PATH && ddev exec ./bin/console theme:compile