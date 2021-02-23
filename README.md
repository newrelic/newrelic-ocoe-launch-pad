[![Community Project header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Community_Project.png)](https://opensource.newrelic.com/oss-category/#community-project)

# Observability Centre of Excellence: Launch Pad


This repository contains the "Launch Pad": a starter kit for building your own wiki-like knowledgebase intended to jump start your Observability Centre of Excellence. 

The wiki skeleton consists of a number of markdown pages that cover many areas of the knowledge base from account information to quick start reference guides. Customise the content to suit your needs.


## Try it out!
The Launch Pad is rendered from static markdown files using [docsify](https://docsify.js.org/). This automatically renders the markdown nicely into a website.

**To view the rendered version of this repo visit here: [View the Rendered Launch Pad](https://newrelic.github.io/newrelic-ocoe-launch-pad/)**

## Installation

The wiki is marked up using markdown. Clone it and customise to your needs. You will find a number of `TODO` sections where you need to add your own information. Search for all of these and add your own content.

> The content can be imported to a tool of your choice or hosted directly as a static html site. Should you be using GitHub Enterprise you could host it directly on GitHub using GitHub pages as in the example above. Please understand that GitHub pages are public though so ensure you site is secure and do not host on public GitHub pages.


## Running Locally
To develop and view the rendered site locally install docsify globally:
```
npm i docsify-cli -g
```

Start the server by running:
```
npm start
```

You should now be able to browse the site at [localhost:3000](http://localhost:3000)


## Hosting documentation
The documentation can be hosted on github pages or by any simple http server. To use the pre-built Docker container that hosts the site with pm2 do the following:

To build the image:
```
docker build -t launchpad .
```

To run the image on port 8080:
```
docker run -p8080:8080 launchpad
```

View the site at http://localhost:8080

## Support

New Relic hosts and moderates an online forum where customers can interact with New Relic employees as well as other customers to get help and share best practices. Support for the Launch Pad is available from the project maintainers via the [GitHub issues](https://github.com/newrelic/newrelic-ocoe-launch-pad/issues) feature.


## Contributing
We encourage your contributions to improve the Launch Pad! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project.
If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company,  please drop us an email at opensource@newrelic.com.

## License
The Observability Centre of Excellence Launch Pad is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

