# Changelog

Versions follow [Semantic Versioning](https://semver.org). Until 1.0, a minor version
may change how things work.

## 0.1.0 - 2026-10-24

The first release.

- Puts the components together: `shell.qml`, the launcher script `twilight-shell`, and the components as submodules at the commits they were tested with.
- `make install` for everything, or `make install ONLY="bar"` for a part with what it needs.
- `twilight-shell lock` and `lock preview`, `twilight-shell config init`, and IPC to every component.
- Checks that run on every push.
