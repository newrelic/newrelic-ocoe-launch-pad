# New Relic Alerts
Alerts lets you set up robust and customizable alert policies for anything that you can monitor. Receive notifications for fluctuations in key performance metrics as data streams in from all of the New Relic products, including APM, Infrastructure, Browser, Mobile, and NRQL queries.

## Alert Workflow
New Relic alerts are based on policies. Each policy contains one or more conditions that may trigger at a given threshold to create a violation which triggers the generation of an incident. The occurrence of an incident can be communicated via a number of notification channels such as by email, Slack, Teams, Pager duty, etc, or any other webhook powered application.

Alert policies can be created within the New Relic UI, via the [API](https://docs.newrelic.com/docs/alerts/rest-api-alerts/new-relic-alerts-rest-api/rest-api-calls-new-relic-alerts) or managed using the [New Relic Terraform provider](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy).

For an introduction to alerts and the alert workflow see: [Introduction to Alerts](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/get-started/introduction-alerts)

### Policies
Polices contain conditions. You can specify the [incident preference](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-policies/specify-when-alerts-create-incidents) which controls whether the policy generates a single incident for all conditions that violate, an incident per condition or and incident per condition per entity. 

You can assign zero or more notification channels to a policy. These channels are notified when an incident occurs, when it is acknowledged and when it closes.

Learn how to creat and configure alert polices: [Alert policies](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-policies/create-edit-or-find-alert-policy)

### Conditions
A condition describes a monitored data source and the behavior of that data source that will be considered a violation. Conditions can be created for many types of data and there are different controls for these. All conditions allow you to set a warning (yellow) and critical (red) threshold. Entities that are subject to a warning or critical violation are highlighted as such in the New Relic UI.

> Only critical violations trigger incidents that dispatch notifications. If you are managing criticality in another tool such as PagerDuty you may need to create polices for warning and critical status.

Learn how to setup different types of alert condition here: [Create alert conditions](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-alert-conditions) 

#### NRQL driven alert conditions
NRQL driven alerts are the most flexible and allow you to alert on any data within the Data Telemetry Platform. NRQL alerts are  quickest to detect and can be also be configured to manage [signal loss and data gaps](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/get-started/streaming-alerts-key-terms-concepts). 

Almost all NRQL queries can be used with alerts, though they might need to be adjusted to work correctly with the streaming alerts platform. 

To learn more about how to use NRQL alerts and the configuration options see the documentation here: [NRQL alert conditions](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-nrql-alert-conditions)

#### Baseline alert conditions
You can use baseline conditions to define violation thresholds that adjust to the behavior of your data. Baseline alerting is useful for creating conditions that only notify you when data is behaving abnormally or dynamically adjust to changing data and trends, including daily or weekly trends. When you create a baseline alert you select a sensitivity threshold, the UI shows you how the threshold affects the data sample.

Documentation on baseline alerts can be found here: [Creating baseline alerts](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/create-baseline-alert-conditions)

#### Outlier detection conditions
The outlier detection feature parses the data returned by a faceted NRQL query and looks for the number of expected groups that you specify and looks for outliers (values deviating from a group) based on the sensitivity and time range you set. For example you might set a condition that watches the CPU use across a cluster of hosts and set the outlier detection to notify you when a host deviates from the pack.

View the documentation for instructions on how to setup an outlier condition and some examples of what outliers will be detected: [Outlier detection](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-conditions/outlier-detection-nrql-alert)

## Notification channels
New Relic supports multiple different types of notification channel: User, Email, OpsGenie, PagerDuty, Slack, VictorOps and a **generic webhook**. If you have the [New Relic mobile app](https://newrelic.com/platform/mobility) you can also receive push notifications.

Notification channels can be shared by multiple policies and so only need to be setup once. For details on how to create notification channels see the documentation: [Notification channels: Control where to send alerts](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-notifications/notification-channels-control-where-send-alerts)

### Generic webhook
One of the notification channels is a general webhook. This can be configured with the data payload of your choice and will be dispatched like any other notification. 

Learn about setting up a webhook here: [Create a webhook](https://docs.newrelic.com/docs/alerts-applied-intelligence/new-relic-alerts/alert-notifications/customize-your-webhook-payload)

> One common pattern is to send alert notifications back to New Relic database so that you can easily query and report against them with NRQL. Find out how to [send alerts data to New Relic](https://blog.newrelic.com/product-news/sending-alerts-data-to-insights/)