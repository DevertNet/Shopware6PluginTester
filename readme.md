# Shopware6PluginTester
Cypress Browser Testing for Shopware 6 Plugins.

## Usage
- Clone this repo into your plugin folder path should be: ./YouPlugin/Shopware6PluginTester
- Fire ./run.sh

## Add new shopware version to this repo
1. Clone new shopware version into the shopware folder and delete .git folder
2. configure ddev (nginx conf and .env.plugintester file)
3. use sql dump from an already added shopware version as basis, upgrade from this dump to new version
4. Change URL
5. dump the db
6. Add new version to run.sh
