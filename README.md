<!-- PROJECT LOGO -->
  <br />
    <p align="center">
    <img src="img/icon.png" alt="Logo" width="130" height="130">
  </a>
  <h1 align="center">SurrealDB-choco (unofficial)</h1>
  <p align="center">
    An (unofficial) Chocolatey distribution of SurrealDB.
  </p>
  <p align="center">
    NOTE: SurrealDB is not my idea, I'm just a guy trying to use it in my own projects. You can find everything about the project at SurrealDB's website (https://surrealdb.com).
  </p>

# Quick Start

The package is available via [Chocolatey](https://chocolatey.org/install) as https://community.chocolatey.org/packages/surreal/ .

It can be installed using an administrative shell:
```bash
choco install surreal --pre
```

The command `surreal` is now available on any windows shell as a choco-shim.

# Autoupdating

The package is automatically updated in the Chocolatey registry every week on Friday 18:00 UTC.

For more info on how this is done, see the workflow [bump-choco.yml](.github/workflows/bump-choco.yml)