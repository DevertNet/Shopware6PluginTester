
# Shopware6PluginTester
Cypress Browser Testing for Shopware 6 Plugins. This tool will test your plugin against every SW6 version (>6.1.3) with your custom cypress tests.
With the magic of ddev on every run of this tool the shopware 6 instances will be reseted to a fresh sw6 installtion.

## Requirements
- https://github.com/drud/ddev
- composer
- npm

## Usage
- Clone this repo anywehere
- Fire ```npm install```
- Fire ```./run.sh /path/to/your/plugin/ YourPluginName``` e.g. ```./run.sh /home/leon/htdocs/git/DevertAutoMetaDetails/ DevertAutoMetaDetails```

### Plugin path
Your plugin directory (e.g. ```/path/to/your/plugin/```) should contain the hole plugin. So the composer.json should be here: ```/path/to/your/plugin/composer.json```
The directory will be copied to every shopware instance e.g. ```shopware/6.1.3/custom/plugins/YourPluginName```

### Cypress Tests
Cypress search the tests in your plugin directory (e.g. ```/path/to/your/plugin/```). So in the background cypress will be launched with your plugin directory as project path.
- ```/path/to/your/plugin/cypress```
- ```/path/to/your/plugin/cypress.json```

### Save Time
If you want to run the tests a few times in a row, you can save time by skipping the setup of shopware and launch of ddev.
This is possible with a extra parameter:
```./run.sh /path/to/your/plugin/ YourPluginName cypress```

## Add new shopware version to this repo
1. Use ```./tools/shopware-downloader.sh 6.1.4```
2. Add new version to ```run.sh```