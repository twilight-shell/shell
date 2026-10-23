# Contributing to shell

Thank you for helping. The guide for every repository of the organization is [here](https://github.com/twilight-shell/.github/blob/main/CONTRIBUTING.md): how to propose a change, the commit messages, the checks and the code style. What follows is what is particular to this repository.

## Working on it

- **What it needs:** nothing from the other components.
- **Run it:** `XDG_CONFIG_HOME=$(mktemp -d) bin/twilight-shell` (the first part keeps your real settings out of it). Talk to it with `bin/twilight-shell ipc call ...`.
- **Tests:** there is no test for the screen: run it and look, and say in the pull request what you tried and on which compositor.
- **Before sending:** run the checks of the guide (`ci/run-tests.sh`, `check-settings.sh`, `check-depends.sh`, `check-install.sh` from the `.github` repository) and add a line to `CHANGELOG.md` under `## Unreleased`.

## Good to know

- Wiring goes here and nowhere else: if two components have to know about each other, pass a property or a signal through `shell.qml`.
- A new component is a submodule, a line in `MODULES` of the `Makefile`, an entry in `shell.qml` and a row in the README. A change to a component reaches here as a pull request that moves its submodule.
- The running shell reads the module path at startup: a new module needs a restart, not a reload.

For security problems, please don't open an issue: see [SECURITY.md](https://github.com/twilight-shell/.github/blob/main/SECURITY.md).
