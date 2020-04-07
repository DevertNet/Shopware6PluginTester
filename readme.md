
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
- Open cypress to write tests: ```./setup.sh /path/to/your/plugin/ YourPluginName``` e.g. ```./run.sh /home/leon/htdocs/git/DevertAutoMetaDetails/ DevertAutoMetaDetails```
- Test against all shopware 6 versions in cli: ```./run.sh /path/to/your/plugin/ YourPluginName``` e.g. ```./run.sh /home/leon/htdocs/git/DevertAutoMetaDetails/ DevertAutoMetaDetails```

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


## Keep & Clear Cookies

By default Cypress does not keep cookies across tests.
```cypress/support/commands.js```

Keep all cookies
```js
Cypress.Cookies.defaults({
	whitelist: function(cookie) {
		return true;
	}
})
```

Clearing all cookies with one command does not work. Use this in your tests:
```js
cy.clearCookie('tax_switch') //Custom cookie
cy.clearCookie('cookie-preference') //Cookie Consent Bar
cy.clearCookie('session-') //User Session
 ```
## Keep LocalStorage
By default Cypress does not keep the local storage across tests.
```cypress/support/commands.js```

(Source: https://stackoverflow.com/a/55234197)
```js
Cypress.Commands.add("saveLocalStorage", () => {
    cy.log('saveLocalStorage')
    Object.keys(localStorage).forEach(key => {
        LOCAL_STORAGE_MEMORY[key] = localStorage[key];
    });
});

Cypress.Commands.add("restoreLocalStorage", () => {
    cy.log('restoreLocalStorage')
    Object.keys(LOCAL_STORAGE_MEMORY).forEach(key => {
        localStorage.setItem(key, LOCAL_STORAGE_MEMORY[key]);
    });
});

beforeEach(() => {
    cy.restoreLocalStorage();
});

afterEach(() => {
    cy.saveLocalStorage();
});
```

## Clear shopware Cache during a test
```cypress/support/commands.js```

```js
Cypress.Commands.add('clearShopwareCache', () => {
    cy.exec('cd ' + Cypress.env('SW_PATH') +' && ddev exec ./bin/console cache:clear');
})
```
Use this in your tests:
```js
cy.clearShopwareCache().wait(500);
 ```

## Change shopware configuration
```cypress/support/commands.js```

```js
Cypress.Commands.add('setShopwareConfiguration', (key, value) => {
    if (typeof value === 'string' || value instanceof String)
    {
        value = '\\"' + value + '\\"';
    }

    cy.exec('cd ' + Cypress.env('SW_PATH') +' && echo "UPDATE system_config SET configuration_value=\'{\\"_value\\":' + value + '}\' WHERE configuration_key=\'' + key + '\'" | ddev mysql').then((result) => {
        cy.log(result.stderr);
        cy.log(result.stdout);
    })
})
```
Use this in your tests.
Your can find your keys in the database table "system_config".
```js
cy.setShopwareConfiguration('DevertRichSnippets.config.homename', 'Home');
cy.setShopwareConfiguration('DevertRichSnippets.config.hideBreadcrumb', 0);
cy.clearShopwareCache().wait(500); // Don't forget to clear the shopware cache ;)
 ```