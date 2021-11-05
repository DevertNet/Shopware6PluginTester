# Shopware6PluginTester

Cypress Browser Testing for Shopware 6 Plugins. This tool will test your plugin against every SW6 version (>6.1.3) with your custom cypress tests.
With the magic of ddev on every run of this tool the shopware 6 instances will be reseted to a fresh sw6 installtion.

## Requirements

- https://github.com/drud/ddev (min. 18.0, because mutagen will be used)
- composer
- npm

## Usage

- Clone this repo anywehere
- Fire `npm install`
- Open cypress to write tests: `./run.sh 6.4.6.0 /path/to/your/YourPluginName/` e.g. `./run.sh 6.4.6.0 /home/leon/htdocs/git/DevertAutoMetaDetails/`

### Plugin path

Your plugin directory (e.g. `/path/to/your/plugin/`) should contain the hole plugin. So the composer.json should be here: `/path/to/your/plugin/composer.json`
The directory will be copied to every shopware instance e.g. `shopware/6.1.3/custom/plugins/YourPluginName`
The folder must be named like the plugin e.g. `YourPluginName`

### Cypress Tests

Cypress search the tests in your plugin directory (e.g. `/path/to/your/plugin/`). So in the background cypress will be launched with your plugin directory as project path.

- `/path/to/your/plugin/cypress`
- `/path/to/your/plugin/cypress.json`

## Keep & Clear Cookies

By default Cypress does not keep cookies across tests.
`cypress/support/commands.js`

Keep all cookies

```js
Cypress.Cookies.defaults({
  whitelist: function (cookie) {
    return true;
  },
});
```

Clearing all cookies with one command does not work. Use this in your tests:

```js
cy.clearCookie("tax_switch"); //Custom cookie
cy.clearCookie("cookie-preference"); //Cookie Consent Bar
cy.clearCookie("session-"); //User Session
```

## Keep LocalStorage

By default Cypress does not keep the local storage across tests.
`cypress/support/commands.js`

(Source: https://stackoverflow.com/a/55234197)

```js
Cypress.Commands.add("saveLocalStorage", () => {
  cy.log("saveLocalStorage");
  Object.keys(localStorage).forEach((key) => {
    LOCAL_STORAGE_MEMORY[key] = localStorage[key];
  });
});

Cypress.Commands.add("restoreLocalStorage", () => {
  cy.log("restoreLocalStorage");
  Object.keys(LOCAL_STORAGE_MEMORY).forEach((key) => {
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

tbd

## Change shopware configuration

tbd
