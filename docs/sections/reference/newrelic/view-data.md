# View data in New Relic
Data ingested to the New Relic Telemetry Data Platform drives the charts and tools and applications that power observability. There are many ways to view the data either through views curated by New Relic, your own custom dashboards and apps or even programmatically through the API.

> [Training](/sections/training/training.md) is available for many of the topics on this page.

## View your data
New Relic provides many different ways to explore and understand your data. Curated experiences provide out of the box observability whilst more advanced tools such as workloads and the query builder allow you to observe the specific data you are interested in.

### Curated experience
[Full Stack Observability](https://docs.newrelic.com/docs/full-stack-observability/observe-everything/get-started-new-relic-observability/get-started-full-stack-observability) users have access to the full curated experience from New Relic. These curated views allow you to allow to visualize, analyze, and troubleshoot your entire software stack with out of the box charts and features. 

Access the curated views through the top navigation in New Relic: APM, Browser, Synthetics, Mobile, and Infrastructure

When the pre-built curated views do not fully service your needs you can create your own custom Dashboards or deploy custom applications to render the data you need.

### Entity explorer
The New Relic Entity Explorer is where you can find all of the [entities](https://docs.newrelic.com/docs/new-relic-one/use-new-relic-one/core-concepts/what-entity-new-relic) reporting to New Relic. It allows you to quickly find and access the data for entities reporting to New Relic.

Learn how to use the explorer here: [Entity Explorer](https://docs.newrelic.com/docs/new-relic-one/use-new-relic-one/ui-data/entity-explorer-view-performance-across-apps-services-hosts)

### Data Explorer
The New Relic data explorer allows you to navigate all your data visually, without any​​​ NRQL knowledge. Use the data explorer to access, query and customize your data, create visualizations, and make connections between your services in a consistent and curated experience.

Learn more about the data explorer: [New Relic Data Explorer](https://docs.newrelic.com/docs/query-your-data/explore-query-data/data-explorer/introduction-data-explorer)

### Query Builder
With the query builder, you can run queries of your data to create custom charts and other visualizations. You can build custom dashboards from these visualisations. 

New Relic uses its own sql-like query language called NRQL to query the data in Telemetry Platform. The query builder helps you build these NRQL queries with little knowledge of NRQL itself and allows you to quickly construct the queries you need. 

To learn more about the query builder: [https://docs.newrelic.com/docs/query-your-data/explore-query-data/query-builder/introduction-query-builder]()

> The query builder also supports PromQL style syntax for Metric data

### NRQL
New Relic Query Language (NRQL) allows you to query the data in the Telemetry Platform. It is sql-like so should be familiar but is its own syntax. NRQL drives all of the charts and visualisations on the dashboard. When starting out with NRQL it is recommended to begin with the Query Builder which allows you to construct the query and then view the NRQL generated.

Training sessions are available for NRQL and the basics can be found here: [Introduction to NRQL](https://docs.newrelic.com/docs/query-your-data/nrql-new-relic-query-language/get-started/introduction-nrql-new-relics-query-language)

> New Relic have an application called "[NRQL Lessons](https://opensource.newrelic.com/projects/newrelic/nr1-learn-nrql)" that is dedicated to teaching NRQL that can be installed to your account via the [App Catalog](https://one.nr/0vwBKx8R). This app is **highly recommended** to quickly learn the basics and advanced features of NRQL. 

### Dashboards
Dashboards allow you to build a custom view of your data that you can share with others. Many of the charts found in the curated views can be added to a dashboard (end edited) and you may add your own charts and widgets to dashboards using the Query builder or NRQL.

Learn more about dashboarding here: [Introduction to Dashboards](https://docs.newrelic.com/docs/query-your-data/explore-query-data/dashboards/introduction-new-relic-one-dashboards)

### Workloads
The New Relic workloads feature gives you the ability to group and monitor entities based on a team or a set of responsibilities, from front-end to back-end services, across your entire stack. Workloads give you visibility into the end-to-end availability and consumption of resources across an entire service, and provide you a way to define what’s relevant to you. You can use workloads to group together entities that are important to a specific team or project, so you can better browse and isolate the most relevant data for that service.

Learn more about setting up workloads for your service or stack: [Get started with Workloads](https://docs.newrelic.com/docs/new-relic-one/use-new-relic-one/workloads/workloads-isolate-resolve-incidents-faster)

### Logs
The New Relic Logs UI allows you to view the log stream and filter by attributes. You can spot interesting patterns, examine more context around a particular log line and share the data with charts, add to dashboards, etc.

Learn about using the UI for exploring logs: [Using the Logs UI](https://docs.newrelic.com/docs/logs/log-management/ui-data/explore-your-data-log-analytics)

The syntax for querying log data is a little different to querying data via NRQL (although you can query Log data with NRQL if you wish). The auto-complete in the query bar of the logs UI should assist but more detail on how to use the query syntax can be found here: [Logs Query Syntax](https://docs.newrelic.com/docs/logs/log-management/ui-data/query-syntax-logs)

## Validating ingest data
As soon as data has arrived from agents, integrations and API's you should be able to see it in the relevant section within the UI. This section describes how you can validate data is being received.

### APM Data
Once an application is reporting its data to New Relic you should be able to find it within the `APM` section of the UI. Applications are listed by name and appear as soon as data has arrived. You may also find applications in the `Services` group of the `Entity Explorer`.

You can also verify the data being received for an application by querying the data directly using NRQL in the chart builder:

```nrql
select * from Transaction where appName='your-app-name'
```

You should see transactions appearing. If not make sure your app is running and send it some traffic. Sometimes it may take a short moment for new apps data to appear.

#### Infrastructure data
Data from the infrastructure agent is visible in the `Infrastructure` section of the New Relic UI. Once a host is reporting it should appear in the `Hosts` tab. Alternatively can also look for the hosts in the `Entity Explorer` under the `Hosts` group.

You can manually verify the data being received with the following NRQL query:

```nrql
select * from SystemSample where hostname='your-host-name'
```

If you cant find your host, check that the host name is as expected or that you have set a specific display name. You can also look for it in NRQL with the `LIKE` operator using `%` as a wildcard:

```nrql
select * from SystemSample where hostname like 'host-xy%'
```

### Browser Data
As soon as a browser running the Browser agent has sent data you should be able to find the application in the `Browser` section of the New Relic UI. It will also appear in the `Browser applications` group in the `Entity Explorer`.

You can manually confirm the data being received for a Browser application with the following NRQL:

```nrql
SELECT * from PageView where appName='your-app-name'
```

### Mobile Data
When you create a mobile application it will appear in the UI before any data is received. Find  your app in the `Mobile` section of New Relic and review the summary screens to see if data is being received. 

> If you are testing a new app you may need to open and close the app or use it for some time before the metric payload is dispatched to New Relic and becomes visible.

You can manually verify the data being received from Mobile apps by querying the `Mobile*` tables with NRQL:

```nrql
SELECT * from Mobile where appName='your-app-name'
```

### Logs Data 
Logs data should become visible in the `Logs` section of New Relic as soon as they begin streaming in. You can filter the log stream to search for your specific logs by filtering on an attribute. For example to filter by host name you might add the following: `host:"your-host-name"`

It is also possible to query the logs with NRQL:
```nrql
SELECT * from Log where host='your-host-name'
```

### Synthetics data
Synthetics automatically report to New Relic and you should be able to view the results of checks from the summary screen for you monitor. Find your monitor in the `Entity Explorer > Synthetic monitors` section or via the `Synthetics` section of the UI.

You can also view the raw data from Synthetic monitors with NRQL:

```nrql
SELECT * from SyntheticCheck where monitorName='your-monitor-name'
SELECT * from SyntheticRequest where monitorName='your-monitor-name'
```

