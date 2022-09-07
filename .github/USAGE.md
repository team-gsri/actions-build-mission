# AddonBuilder Github action

This document describes how to use the `team-gsri/actions-build-mission` Github action.

## Table of contents
* [Limitations](#requirements-and-limitations)
* [Installation](#installation)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Example](#example)

## Requirements and limitations

> **This action can only be used on Windows runners** and requires installation of the Arma 3 Tools. This requires you to agree to the Steam EULA, Arma 3 EULA, and BI Tools EULA. You can install the arma 3 tools using steamcmd.

This action also requires Powershell 7+

## Installation

* Download and install [Arma 3 Tools](https://store.steampowered.com/app/233800/Arma_3_Tools/)
* Set a machine environment variable `ARMA3TOOLS` with the path to the tools directory

You can also use [Steamcmd](https://developer.valvesoftware.com/wiki/SteamCMD) to download, install, and update the Arma 3 Tools without the Steam client. In both case, you need a valid steam account with subscription to the Arma 3 Tools in order to accept EULAs, but you don't need to own the game itself.

## Inputs

### `source`

**Required.** Path to the source directory to pack, relative to repository root.

### `target`

**Required.** Path to a directory where the action will put the pbo file, relative to the repository root.

### `briefingName`

**Optional.** If not empty, this value will overwrite the mission's briefingName value before building the pbo. Double quotes (") are ignored to prevent injection. Usefull to inject versioning information such as version number of commit ref.

## Outputs

*There is no output*

## Example

This example will rename the mission to `Orion main` and pack content of `missions/Orion.Malden` into `output/Orion.Malden.pbo` :

```yml
uses: team-gsri/actions-build-mission@0.1.0
with:
  briefingName: Orion ${{ gitbub.ref_name }}
  source: 'missions/Orion.Malden'
  target: 'output'
```