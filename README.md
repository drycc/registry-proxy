# Drycc Registry Proxy
[![Build Status](https://woodpecker.drycc.cc/api/badges/drycc/registry-proxy/status.svg)](https://woodpecker.drycc.cc/drycc/registry-proxy)

Drycc (pronounced DAY-iss) Workflow is an open source Platform as a Service (PaaS) that adds a developer-friendly layer to any [Kubernetes](http://kubernetes.io) cluster, making it easy to deploy and manage applications on your own servers.

For more information about the Drycc Workflow, please visit the main project page at https://github.com/drycc/workflow.

We welcome your input! If you have feedback, please [submit an issue][issues]. If you'd like to participate in development, please read the "Development" section below and [submit a pull request][prs].

# About

registry-proxy is a proxy deployed on every Kubernetes worker node, proxying all requests to the Drycc Workflow [registry][registry]. This allows the worker nodes daemons to communicate to the registry over localhost, bypassing the need for adding the `--insecure-registry` flag to the daemons.

# Development

The Drycc project welcomes contributions from all developers. The high level process for development matches many other open source projects. See below for an outline.

* Fork this repository
* Make your changes
* [Submit a pull request][prs] (PR) to this repository with your changes, and unit tests whenever possible.
  * If your PR fixes any [issues][issues], make sure you write `fixes #1234` in your PR description (where #1234 is the number of the issue you're closing)
* The Drycc core contributors will review your code. After each of them sign off on your code, they'll label your PR with LGTM1 and LGTM2 (respectively). Once that happens, the contributors will merge it

## Testing Your Code

When you've built your new feature or fixed a bug, make sure you've added appropriate unit tests and run `make test` to ensure your code works properly.


[issues]: https://github.com/drycc/registry-proxy/issues
[prs]: https://github.com/drycc/registry-proxy/pulls
[registry]: https://github.com/drycc/registry
[v2.18]: https://github.com/drycc/workflow/releases/tag/v2.18.0
