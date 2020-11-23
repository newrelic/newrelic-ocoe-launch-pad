# Synthetics
New Relic's [synthetic monitoring](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/getting-started/get-started-new-relic-synthetic-monitoring) simulates user traffic around the world so you can detect and resolve poor performance and outages before your customers notice. New Relic's suite of automated, scriptable tools allow you to monitor your external and internal websites, critical business transactions, and API endpoints.


## Overview
Synthetic monitors can be run from one of many locations around the world. Each monitor can be scheduled to run from every minute to every day from as many of the locations as required. Each job runs in its own simulated browser that can be scripted to replicate user journeys or APi call sequences.

There are four types of monitor you can configure:

- **Ping**  
Ping monitors are the simplest type of monitor. They simply check to see if an application is online. A single GET or HEAD request with response text validation.

- **Simple browser**  
Simple browser monitors essentially are simple, pre-built scripted browser monitors of single endpoints. They make a request to your site using an instance of Google Chrome. Unlike ping monitors you can see all the data from the request and sub resource requests.

- **Scripted browser**  
Scripted browser monitors are used for more sophisticated, customized monitoring. You can create a custom script that navigates your website, takes specific actions, and ensures specific resources are present.

- **Scripted API**
API tests are used to monitor your API endpoints. Like scripted browser you can author a custom script that calls multiple API endpoints to mimic an application call sequence. 

## Creating a monitor
Monitors can be [created through the UI](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/using-monitors/add-edit-monitors#adding-monitors) or via the API. For all types of monitor you need to choose its type, give it a name, choose the locations to run from and select the frequency you wish it to run. 

> Synthetics is priced per job so only select the run frequency you require.

> When using multiple locations Checks are sent to each selected location at least once within the set frequency. The checks are staggered across each period for even distribution. For example a monitor with three locations selected and a frequency of 15 minutes will run three checks every 15 minutes, roughly 5 min apart. Monitors

### Ping & simple browser configuration
Ping monitors just require a URL to test and an optional validation string to test for. The test will be considered a failure if a non 200 response is received or the validation string fails.  For Ping monitors you can also specify whether redirects are followed and whether a GET or HEAD request can be used.

For a step by step guide see: [Creating a Ping or Simple browser monitor](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/using-monitors/add-edit-monitors#simple)


### Scripted browser configuration
Scripted browser monitors run javascript scripts driven by [Selenium web driver](https://www.selenium.dev/selenium/docs/api/javascript/index.html). Each time your script runs, New Relic creates a fully virtualized Selenium-driven Google Chrome browser that navigates your website and follows each step of the script. 

Once you have created the monitor you will need to supply the script to drive the browser. The script can be edited within the UI using the IDE style editor or you can develop your script outside of the monitor and paste it in.

Writing scripted browser scripts is a little complicated but extremely powerful. Follow the documentation here to learn how to create your scripts: [Introduction to Scripted Browsers](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/scripting-monitors/introduction-scripted-browser-monitors)

You can partly automate script creation using the Selenium IDE and New Relic formatter: [Selenium IDE Exporter](https://discuss.newrelic.com/t/relic-solution-selenium-ide-exporter-for-new-relic-synthetics/92510)

Training is available for assisting with script generation.

### Scripted API configuration
Scripted API monitors are similar to scripted browser monitors except they do not run a full browser and there is no UI to control. Instead New Relic uses the http-request module internally to make HTTP calls to your endpoint and validate the results.

Find out how to write API monitor scripts here: [Write synthetic API tests](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/scripting-monitors/write-synthetic-api-tests)

> In addition to the standard synthetic monitoring's WebDriverJS-based scripting environment, New Relic supports many [popular Node.js modules](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/scripting-monitors/import-nodejs-modules) to enhance your scripted browsers and API tests. 

## Custom instrumentation
When monitors run they report data back to New Relic. This data can be queried with NRQL from the `SyntheticCheck` and `SyntheticRequest` events types.  For scripted browser and scripted API monitors you may add custom data to the data to be queried later.

For example, for a scripted browser monitor you might store the number of items in the basket or the response message from an API as a field in the data.

Learn how to add custom data here: [Add custom attributes](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/scripting-monitors/add-custom-attributes-synthetic-monitoring-data)


## Public minions
New Relic uses a group of minions (VM's) to execute your synthetic monitor jobs. These minions are deployed in different data centers around the globe, and they are in charge of actually running your monitors. Because of this, ensure your firewall allows their network requests through it. Minion IP addresses are publicly available in JSON format, so you can easily read and parse them.

Find out more about [Minion IP addresses](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/administration/synthetic-public-minion-ips)


## Private minions
Private minions allow you to run synthetic jobs within your own data center. This allows you to test and monitor applications and API endpoints that are otherwise not publicly accessible. Private minions can be run in a docker container.

To learn how to setup private minions view the documentation here: [Monitor private locations](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/private-locations/monitor-private-locations)

## Secure Credentials
You can use secure credentials with synthetic monitoring to store critical information, such as passwords, API keys, usernames, etc. to use in your scripts. Sensitive information can be added to the secure credential store via the API or through the UI and then referenced in scripted monitors.

Learn how to add credentials and use them in scripts: [Secure credentials](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/using-monitors/store-secure-credentials-scripted-browsers-api-tests)

## Synthetic alerting
You can create alerts that target synthetic monitors and alert you when they fail. You can also create alerts that only fire if *all* locations fail. Alternatively you can setup NRQL based alerts to notify you of your own custom criteria.

Find out more about synthetic alerts: [Synthetic alerts](https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/using-monitors/alerts-synthetic-monitoring)