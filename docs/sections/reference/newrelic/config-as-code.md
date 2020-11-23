# Configuration as Code
Managing your New Relic configuration with code enables you to control changes to the configuration and deploy at scale.

New Relic offers a variety of APIs and SDKs you can use to retrieve data from New Relic products, insert data into those products and adjust settings. Each product has its own REST API and there is also a new and continually evolving NerdGraph graphQL based API. You may need to use a combination of API's to achieve the desired result.

The following applications allow you to test API functionality in a web browser (note not all API's are available here):

- [REST API Explorer](https://rpm.newrelic.com/api/explore)
- [GraphQL APi Explorer](https://api.newrelic.com/graphiql)

## Terraform
The Terraform New Relic Provider covers the majority of the functionality available via the product API's  and is the recommended approach for managing alerts, synthetics and application dashboards. The provider tends to lag new API features by a few weeks but is kept up to date by a team at New Relic. 

Documentation on using the Terraform New Relic provider can be found here: [New Relic Terraform Provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs)


## Product Specific REST APIs
It is possible to manage alerts, dashboards and synthetics through code via the older products REST APIs. The newer graphQL API  is gradually replacing the REST API's.

> Management via Terraform is highly recommended.

### Alerts API
Use the [REST API for New Relic Alerts](https://docs.newrelic.com/docs/alerts/rest-api-alerts/new-relic-alerts-rest-api/rest-api-calls-new-relic-alerts) to:

- Create and manage policies, conditions, and notification channels.
- Create alert conditions based on Insights NRQL queries.
- Create alert conditions based on data from other New Relic products.


### Insights API
Use New Relic Insights API to create custom queries and charts for your data, including data from your other New Relic products. API resources include:

- [Insert events API](https://docs.newrelic.com/docs/insights/insights-data-sources/custom-data/insert-custom-events-insights-api): To report custom data to Insights, use the Event insertion API.
- [Query API](https://docs.newrelic.com/docs/insights/insights-api/get-data/query-insights-event-data-api): To query your Insights data using NRQL-formatted queries, use the Insights query API. This API can also be used to retrieve subscription usage data.
- [Dashboard API](https://docs.newrelic.com/docs/insights/insights-api/manage-dashboards/insights-dashboard-api): To create, read, update, and delete Insights dashboards, use the Insights dashboard API.


### Synthetics API
The [Synthetics REST API](https://docs.newrelic.com/docs/apis/synthetics-rest-api/monitor-examples/manage-synthetics-monitors-rest-api) functionality includes:

- Create and manage Synthetics monitors.
- Manage Synthetics alert notifications.
- Add labels to monitors, and retrieve monitors with specific - labels.

