# Sending data to New Relic
In order to send data to New Relic you will require a valid license key for the account that you wish to send the data to. For many setups the New Relic UI provides this to you during the setup process.

If you need to view your license key outside of a guided setup then find out how here: [New Relic License Key](https://docs.newrelic.com/docs/accounts/accounts-billing/account-setup/new-relic-license-key)

## Application Performance Monitoring (APM)
Monitoring of applications is provided by New Relic agents that run within or alongside the code to instrument its performance. The installation method ofr each language varies but the general approach is the same:

1. Download and install the agent 
2. Add the agent to your code base
3. Configure the agent
4. Verify the data 

Installation and configuration instructions for all the New Relic agents can be found here:
[C](https://docs.newrelic.com/docs/agents/c-sdk/install-configure/install-c-sdk-compile-link-your-code)
[Go](https://docs.newrelic.com/docs/agents/go-agent/get-started/get-new-relic-go)
[Java](https://docs.newrelic.com/docs/agents/java-agent/installation/install-java-agent)
[.NET](https://docs.newrelic.com/docs/agents/net-agent/installation/install-enable-new-relic-net-agent)
[Node.js](https://docs.newrelic.com/docs/agents/nodejs-agent/installation-configuration/install-maintain-nodejs)
[PHP](https://docs.newrelic.com/docs/agents/php-agent/installation/php-agent-installation-overview)
[Python](https://docs.newrelic.com/docs/agents/python-agent/installation)
[Ruby](https://docs.newrelic.com/docs/agents/ruby-agent/installation-configuration/ruby-agent-installation)

### App Naming
Each app that reports to New Relic should be configured with a name. This name is used to group al lthe data for that application. An app running in multiple instances, perhaps across a cluster, should all report the same app name.

Set the app name in the configuration as detailed in the documentation. Review the [application naming standards](/sections/standards/standards.md#naming-conventions) for guidance on how to choose a suitable name for your application.

> Note changing the name of an application will cause it to start reporting to the new name. Data can not be transferred from under the old name to the new name.



### Configuration precedence
Many of the agents support a configuration precedence model. This means that values for configuration settings can be overridden at multiple levels. Each configuration setting has a default value. This is generally then overridden by any values set in the configuration file, which are further overridden by environment or server side configuration values. This means for example you can set a base configuration and then override values as part of CI/CD deployments. Check the configuration settings precedence details in the documentation to understand the options for any given language.

### Tagging
A tag is a key-value pair that can be added to an application. Tags help you group, search, filter, and focus your data to troubleshoot and understand your environment. 

Tags (sometimes referred to as "labels") can be configured in the configuration settings of applications.

For more information about tagging in New Relic see: [Using Tags in New Relic](https://docs.newrelic.com/docs/new-relic-one/use-new-relic-one/core-concepts/tagging-use-tags-organize-group-what-you-monitor)

### Transaction naming
Some of the agents allow you to configure the transaction naming. For known frameworks this tends to be automatic but you may find you need to adjust the settings. 

Transaction naming affects the name a transaction is given and performance data for each transaction name is rolled up in the UI. There is a limit to the number of unique transactions names that can be recorded. 

This is particularly pertinent if URL's contain generated data as each URL would generate a unique name. COnsider the following example URL's:

```
/user/123/control_panel.jhtml
/user/456/control_panel.jhtml
/user/789/control_panel.jhtml
```

Configuring transaction naming would allow you to roll all of these unique URL's into the same 'transaction':

```
MyTransactionName
```

Details on how to set the transaction naming can be found here: [GO](https://docs.newrelic.com/docs/agents/go-agent/instrumentation/instrument-go-transactions), [Java](https://docs.newrelic.com/docs/agents/java-agent/instrumentation/transaction-naming-protocol), [.NET](https://docs.newrelic.com/docs/agents/net-agent/custom-instrumentation/create-transactions-xml-net), [Node.js](https://docs.newrelic.com/docs/agents/nodejs-agent/api-guides/nodejs-agent-api#request-names), [PHP](https://docs.newrelic.com/docs/agents/php-agent/php-agent-api/newrelic_name_transaction), [Python](https://docs.newrelic.com/docs/agents/python-agent/python-agent-api/settransactionname-python-agent-api), [Ruby](https://docs.newrelic.com/docs/agents/ruby-agent/api-guides/ruby-custom-instrumentation#naming-transactions)

### Key Transactions
In APM, you can make a transaction a key transaction when you want it to have a custom level of monitoring, or when you want it to have its own alert policy. These can be any transactions that are important to your business. They are important if you are monitoring your applications Apdex scores.

Key transactions are useful for:

- Important transactions
For your app's most important transactions, making them key transactions means you can quickly find and examine them. You can set stricter Apdex requirements for them, and you can create alert policies for them.

- Slow transactions  
If a transaction is regularly slower than other transactions, it can bring down the Apdex score of the entire application. When you make a transaction a key transaction, you can set a longer-duration Apdex threshold for it so it won't bring down your app's Apdex score.

Discover how to create and configure key transactions here: [Configuring key transactions](https://docs.newrelic.com/docs/apm/transactions/key-transactions/introduction-key-transactions)


### Custom instrumentation
New Relic normally produces complete information automatically, without any need to modify your application code. However, if you are not using a supported framework, you may need to add custom instrumentation.

Custom instrumentation allows you to track interactions that are not captured by New Relic's automatic instrumentation. Custom instrumentation can also add detail to your transaction traces, to help you identify key issues.

You can also use custom instrument to add business metrics to your data.

For a guide on custom instrumentation see the documentation: [Custom instrumentation](https://docs.newrelic.com/docs/agents/manage-apm-agents/agent-data/custom-instrumentation)


### Deployment markers
Deployments of applications can be risky events. New Relic allows you to correlate those events to the performance of your applications, using deployment markers that appear in APM charts. 

Several options are available to manage your deployment data and awe recommend automating the dispatch of a deployment marker as part of CI/CD.

For more information on setting deployment markers see [Record deployments](https://docs.newrelic.com/docs/apm/new-relic-apm/maintenance/record-monitor-deployments)

## Browser 
Browser is a form of real user monitoring that uses a JavaScript snippet (or "agent") to instrument your app's webpages. The JavaScript collects data for browser monitoring. Data is sent directly from your customers browser to New Relic and enables you to analyse the performance of the JavaSCript and application running on the users browser.

The browser agent is usually automatically deployed for apps that are monitored by APM using known frameworks. However, it needs to be [enabled in the UI](https://docs.newrelic.com/docs/browser/new-relic-browser/installation/install-browser-monitoring-agent#select-apm-app) to activate.

> You can disable the automatic browser monitoring in the configuration of the APM agent. 

### Enable with copy/paste method
As an alternative to automatic deployment via APM, you may choose to deploy the Browser agent by manually adding the required code snippet to your applications HTML source. This option is useful for monitoring static sites (such as Jekyll) or cached pages delivered by CDN. 

> This method also allows you to control when new versions of the Browser agent are released to your customers however it also requires you to periodically update the agent version to ensure it does not go too far out of date.

Instructions to deploy the browser agent via this method can be found here: [Deploy browser agent with Copy/Paste method](https://docs.newrelic.com/docs/browser/new-relic-browser/installation/install-browser-monitoring-agent#copy-paste-app)

> Make sure you use the [unique browser licenseKey](https://docs.newrelic.com/docs/browser/browser-monitoring/configuration/browser-license-key-app-id) and not your New Relic account license key

> In general you should choose the Pro+SPA option which is New Relics latest and most powerful Browser agent that supports single page applications as well as more advanced browser metrics.

### Reporting domains
Browser lets you choose which domains or subdomains that a Browser app monitors. This is useful for limiting monitoring only to the application activity you consider important. For example, if you use the copy/paste method to deploy your Browser app, you can set domain conditions to protect the security of your browser monitoring license key and app ID.

Documentation explaining how to configure the reporting domains can be found here: [Monitor or block specific domains and subdomains](https://docs.newrelic.com/docs/browser/new-relic-browser/configuration/monitor-or-block-specific-domains-subdomains)


### Segment allow lists
Browser groups your metrics by URL segment automatically. You can configure how this grouping is performed allowing you to disable roll up for segments you believe are important but have not been automatically recognised.

For example, if you see in the Page Views `/users/*` and you have a path `/users/edit` that you don't see you can fix this by configuring the segment allow list.

Details on how to configure the segment allow list can be found here: [Configure segment allow list](https://docs.newrelic.com/docs/browser/new-relic-browser/configuration/group-browser-metrics-urls)


### Custom instrumentation
You may customise the instrumentation at runtime to set page names, set custom attributes, identify interactions, notice errors, etc. The New Relic agent makes an API available that lets you change or add data to the context. This is useful for recording customised business or debugging information against your application data.

View the API documentation to leverage custom instrumentation: [Browser agent API]()https://docs.newrelic.com/docs/browser/browser-monitoring/browser-agent-spa-api

## Mobile
The [New Relic Mobile Monitoring](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile/get-started/introduction-mobile-monitoring) tools integrate across your entire digital customer experience, so that you can get detailed crash reporting and analytics along with deep diagnostics on code and network performance.

### Apple iOS 
You can install and configure the iOS Mobile agent using CocoPods or manually. Both objective-c and swift are supported.

Installation guides:
- [CocoaPods (recommended)](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/installation/cocoapods-installation)
- [Manual Installation](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/installation/ios-manual-installation)

#### dSYM files
When Apple compiles an app, the dSYM files are also compiled. For New Relic to be able to symbolicate crashes of your Bitcode-enabled app, these dSYM files need to be downloaded from Apple and then uploaded to New Relic.

If you want to be able to view symbolicated crashes follow these guides on [retrieving dSYMs for Bitcode apps](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/configuration/retrieve-dsyms-bitcode-apps) and [uploading dSYM files](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/configuration/upload-dsyms-bitcode-apps)


#### Custom instrumentation
You can add custom data and trigger custom instrumentation using the Mobile SDK. 

The iOS agent automatically instruments methods on [many base classes](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/api-guides/ios-sdk-api-guide#automatic-instrumentation). If you wish to instrument other methods then you can use the SDK API to cause them to be instrumented. For more information about the SDK view the documentation: [iOS SDK Guide](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/api-guides/ios-sdk-api-guide)


Custom data that can be captured and configured includes:

- [Session-level custom attributes](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile/maintenance/add-custom-data-new-relic-mobile#custom-attributes) 
In creating your own attributes, consisting of a key-value pair, you can add custom data for use in tracking session data.
- [Custom breadcrumbs](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile/maintenance/add-custom-data-new-relic-mobile#custom-breadcrumbs)  
Useful for troubleshooting crash causes, custom breadcrumb events track the user's code-level path through the app by seeing which breadcrumb API calls were reached and reporting app status details from those moments.
- [Custom interactions](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile/maintenance/add-custom-data-new-relic-mobile#custom-interactions)  
Custom interactions give you tracing power so you can debug method timings and improve network call efficiency. A common use of interactions is to understand the underlying activity associated with loading a particular app screen.
- [Custom events](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile/maintenance/add-custom-data-new-relic-mobile#custom-events)  
You can instrument custom events to collect data about user activity as a user navigates through your app. That user activity will in turn trigger other data collection: a collection of breadcrumbs, auto-instrumented HTTP requests and errors, auto-instrumented interactions, and custom interactions.


### Apple tvOS
As with iOS installation, the tvOS agent supports installation both using CocoaPods and manually:

- [tvOS CocoaPods Installation](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/tvos/cocoapods-tvos-installation-configuration)
- [tvOS Manual Installation](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-ios/tvos/tvos-installation-configuration)

> Details regarding dSYM and SDK API are as per the iOS agent.

### Android
The New Relic Android Mobile agent supports multiple environments. For installation instructions for you environment consult the relevant installation documentation: 
[Install and conigure New Relic Mobile for Android](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-android/install-configure)

#### Custom instrumentation
You can add custom data and trigger custom instrumentation using the Mobile SDK API. 

The Android agent automatically instruments methods on [many base classes](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-android/api-guides/android-sdk-api-guide#methods-instrumented). If you wish to instrument other methods then you can use the SDK API to cause them to be instrumented. For more information about the SDK view the documentation: [Android SDK API Guide](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-android/api-guides/android-sdk-api-guide)

Custom data that can be captured is as per iOS listed above.

#### Support for ProGuard and Dexguard
New Relic Mobile supports both ProGuard and DexGuard. View the documentation here: [Configure ProGuard and DexGuard](https://docs.newrelic.com/docs/mobile-monitoring/new-relic-mobile-android/install-configure/configure-proguard-or-dexguard-android-apps)


## Infrastructure
New Relic Infrastructure provides flexible, dynamic monitoring of your entire infrastructure, from services running in the cloud or on dedicated hosts to containers running in orchestrated environments.

### Infrastructure agent
Data is sent to New Relic via an agent that can be installed directly onto a Windows or Linux host. The agent also acts as gateway for metric information delivered from on host integrations. If you are deploying to a kubernetes environment then instead use the kubernetes integration.

Find the instructions for installing the infrastructure agent on your environment here: [Install the Infrastructure Agent](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent)

New Relic also provides some guidance on [installing the agent with common configuration tools](https://docs.newrelic.com/docs/infrastructure/install-infrastructure-agent/config-management-tools) such as Ansible, Chef & Puppet

> You may need to send traffic to New Relic via a proxy. In this case you can either set the NRIA_PROXY environment variable to the proxy address or add the following: `proxy: proxy.domain:port`

### On-Host Integrations
The infrastructure agent can be extended to monitor many different server side applications such as Apache, Kafka, JMX, etc using ["On-host Integrations"](https://docs.newrelic.com/docs/integrations/host-integrations/getting-started/introduction-host-integrations). These integrations require the infrastructure agent to be present and running.

Existing integrations can be found in the `Infrastructure > Third-party services` section of New Relic. 

Once you have installed and configured the agent navigate to the Infrastructure section of New Relic to confirm your hosts are appearing.

#### Installing an integration
The general process for installing an infrastructure on-host integration is:

1. Find the application install guide in the [on-host integrations list](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list)
2. Install and configure the infrastructure agent and any other dependencies specified
3. [Install the on-host integration](https://docs.newrelic.com/docs/integrations/host-integrations/installation/install-infrastructure-host-integrations) providing the name of the integration
4. Rename and edit the sample configuration files as required
5. Restart the infrastructure agent

Once an integration is running it should appear in the `Infrastructure > Third-party services` section of New Relic. Integrations tend to come with some curated dashboards out of the box but you are encouraged to create your own dashboards using the data.

### Using Flex for unsupported services
If you want to report data from a service not currently supported by New Relic then you may use [New Relic Flex](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/flex-integration-tool-build-your-own-integration) to capture the data you need. 

Flex is an application-agnostic, all-in-one tool that allows you to collect metric data from a wide variety of services. It comes **bundled with the New Relic Infrastructure agent**. You can instrument any app that exposes metrics over a standard protocol (HTTP, file, shell) in a standard format (for example, JSON or plain text).

To use Flex you create a YAML config file, start the Infrastructure agent, and your data is reported to New Relic.

For more information about using and configuring Flex view the documentation: [New Relic Flex](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/flex-integration-tool-build-your-own-integration)

### Cloud integration
New Relic can integrate with multiple cloud providers. There's no installation process for cloud integrations, you simply connect your New Relic account to your cloud provider account.

You can find a list of services supported by cloud provider here:
- [Amazon Web Services (AWS)](https://docs.newrelic.com/docs/integrations/amazon-integrations/aws-integrations-list)
- [Microsoft Azure](https://docs.newrelic.com/docs/integrations/microsoft-azure-integrations/azure-integrations-list)
- [Google Cloud Platform (GCP)](https://docs.newrelic.com/docs/integrations/google-cloud-platform-integrations/gcp-integrations-list)

#### Configuring AWS
To connect your Amazon account to New Relic you will first need to create an IAM role that allows New Relic to access your cloudwatch data. 

Full details on how to achieve this can be found here: [Connect AWS to New Relic](https://docs.newrelic.com/docs/integrations/amazon-integrations/get-started/connect-aws-infrastructure)

Once you have connected to Amazon you should enable the individual services that you wish to see data for in the `Infrastructure > AWS` section of New Relic. 

> Bear in mind that the more services you enable and the higher the polling frequency the greater the costs from Amazon will be for Cloudwatch API access. 


#### Configuring Azure
To connect your Azure account to New Relic you will need to create a New Relic application key and grant it permission to access the services you want to monitor. You may then setup the services in the `Infrastructure > Azure` secition of New Relic.

Full instructions for activating Azure can be found here: [Activate Azure Integrations](https://docs.newrelic.com/docs/integrations/microsoft-azure-integrations/getting-started/activate-azure-integrations)


#### Configuring GCP
To start receiving Google Cloud Platform data with New Relic GCP integrations, connect your Google project to New Relic infrastructure monitoring. You will need to configure you project authorization and permissions to allow data access.

Full instructions for activating GCP can be found here: [Connect GCP Services](https://docs.newrelic.com/docs/integrations/google-cloud-platform-integrations/get-started/connect-google-cloud-platform-services-new-relic)


## Kubernetes
New Relic's Kubernetes integration instruments the container orchestration layer by reporting metrics from Kubernetes objects. The integration gives you insight into your Kubernetes nodes, namespaces, deployments, replica sets, pods, and containers.

Installation of the kubernetes integration requires the following steps:

- Ensuring that [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics#kubernetes-deployment) is installed
- Deploying the newrelic-infra agent as a daemon set
- Configuring the agent with cluster name and licence key

Follow the installation instructions in the documentation to setup the infrastructure agent in your cluster: [Install and configure Kubernetes Integration](https://docs.newrelic.com/docs/integrations/kubernetes-integration/installation/kubernetes-integration-install-configure).  

A helm installation is also available: [Install Kubernetes integration using Helm](https://docs.newrelic.com/docs/integrations/kubernetes-integration/installation/install-kubernetes-integration-using-helm)


> When you first deploy the kubernetes infrastructure agent a default alert policy will be created in the account. This is not connected to any notification channels but drives the warning/critical status of pods and containers in the kubernetes explorer. You may replace this with your own policy but ensure that the core conditions are kept.


### Recommended Kubernetes integrations
In addition to deploying the core Kubernetes infrastructure agent it is recommended to also deploy the following integrations to gain the best observability of your EKS clusters:

- [Metadata injector](https://docs.newrelic.com/docs/integrations/kubernetes-integration/link-your-applications/link-your-applications-kubernetes)  
This integration surfaces metadata about the cluster to the APM agents running within. This allows them to be correlated correctly to the cluster allowing APM metrics to appear in the New Relic kubernetes explorer alongside the kubernetes data.

- [Kubernetes Events](https://docs.newrelic.com/docs/integrations/kubernetes-integration/kubernetes-events/install-kubernetes-events-integration)  
The New Relic Kubernetes events integration watches for events happening in your Kubernetes clusters and sends those events to New Relic. To visualize your event data, use the Kubernetes cluster explorer in New Relic One platform, or use the Infrastructure Events UI.

- [Prometheus OpenMetrics](https://docs.newrelic.com/docs/integrations/prometheus-integrations/get-started/new-relic-prometheus-openmetrics-integration-kubernetes)  
The Prometheus OpenMetrics integration for Kubernetes scrapes Prometheus endpoints and sends the data to New Relic. It automatically discovers the endpoints in the same way that the Prometheus Kubernetes collector does it. The integration looks for the prometheus.io/scrape annotation or label. You can also identify additional static endpoints in the configuration.


## Logs
New Relic offers a fast, scalable log management platform that allows you to connect your logs with the rest of your telemetry and infrastructure data.

You can send log data to New Relic using a compatible log forwarding plugin:

- Forward your logs from host using the New Relic Infrastructure agent or the New Relic Kubernetes plugin.
- Use New Relic plugins for well-known log forwarders, like [Fluentd](https://docs.newrelic.com/docs/logs/enable-logs/enable-logs/fluentd-plugin-logs), [Fluent Bit](https://docs.newrelic.com/docs/logs/enable-logs/enable-logs/fluent-bit-plugin-logs), and [Logstash](https://docs.newrelic.com/docs/logs/enable-logs/enable-logs/logstash-plugin-logs).
- Stream or ship your logs from Amazon using [AWS Lambda](https://docs.newrelic.com/docs/logs/enable-new-relic-logs/1-enable-logs/aws-lambda-sending-logs-s3) or [Kinesis](https://docs.newrelic.com/docs/logs/enable-new-relic-logs/1-enable-logs/stream-logs-new-relic-using-kinesis-data-firehose).
- Send your logs data using the [New Relic Logs API](https://docs.newrelic.com/docs/introduction-new-relic-logs-api).

For full details of how to configure logs for New Relic visit the documentation: [Enabling log management in New Relic](https://docs.newrelic.com/docs/logs/enable-log-management-new-relic/enable-log-monitoring-new-relic/enable-log-management-new-relic)

Once log management is enabled, you can also connect your logs with your APM agent, Kubernetes clusters, or distributed tracing to get additional contextual logging data with the New Relic [logs in context extensions](https://docs.newrelic.com/docs/logs/enable-log-management-new-relic/configure-logs-context/configure-logs-context-apm-agents).

## Prometheus
New Relic supports ingest of prometheus data. The data can either be scraped directly by the New Relic agents (available for kubernetes and docker) or can be forwarded from your existing prometheus installation using remote write feature:

- Remote Write  
Use this if you currently have Prometheus servers and want an easy way to access your combined metrics from New Relic. It only takes one line of yaml in your Prometheus configuration.
- Kubernetes / Docker agent  
Use this if you’re looking for an alternative or replacement to a Prometheus server that stores all your metrics directly in New Relic. You won’t have to manage any Prometheus servers yourself.
You don't need local storage.

For details on how to setup prometheus integration view the documentation: [Send prometheus data to New Relic](https://docs.newrelic.com/docs/integrations/prometheus-integrations/get-started/send-prometheus-metric-data-new-relic)

> Once prometheus data is being sent to New Relic you are able to set up New Relic as the data source in Grafana. Find out more about [PromQL and Grafana support](https://docs.newrelic.com/docs/integrations/grafana-integrations/get-started/grafana-support-prometheus-promql).