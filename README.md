# The SurrealDB Chocolatey Package

SurrealDB is designed to be simple to install and simple to run - using just one command from your terminal. In addition to traditional installation, SurrealDB can be installed and run with HomeBrew, Docker, or using any other container orchestration tool such as Docker Compose, Docker Swarm, Rancher, or in Kubernetes. Visit the [SurrealDB install page](https://surrealdb.com/install) for more information.

This repository houses the package builder and deployment scripts for publishing the latest SurrealDB release to [community.chocolatey.org](https://community.chocolatey.org/packages/surreal). It checks for new releases on a daily basis, and automatically updates the package listing on Chocolatey for Windows machines.

To install SurrealDB using Chocolatey, using the following command on a Windows machine.

```bash
choco install surreal
```

The `surreal` command will then be avaialble on any Windows shell as a Chocolatey shim.

### Original

This code was created originally by [ProphetLamb](https://github.com/ProphetLamb), and is now an officially maintained package, managed by SurrealDB. The code is licensed under the [MIT](https://choosealicense.com/licenses/mit/) license.
