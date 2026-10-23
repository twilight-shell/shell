# twilight-shell/shell

A Twilight Sparkle themed desktop shell for Wayland, built with
[Quickshell](https://quickshell.org). Dark purple and pink sticker look, the
Monocraft font, and a lot of springy animation.

The shell is made of components that each live in their own repository and work
on their own. This repository puts them together and says how they are connected.

| | |
|---|---|
| [core](https://github.com/twilight-shell/core) | Theme, the sticker UI kit, settings files. |
| [compositor](https://github.com/twilight-shell/compositor) | Workspaces, the focused window and the keyboard layout, the same for every compositor (niri so far). |
| [bar](https://github.com/twilight-shell/bar) | The bar. |
| [app-launcher](https://github.com/twilight-shell/app-launcher) | "Twilight's Library", the app launcher. |
| [popouts](https://github.com/twilight-shell/popouts) | The calendar and the sound mixer that drop from the bar. |

If you want only one of them, install that one: each README says how.

## Requirements

`quickshell` 0.3 or newer, a Wayland compositor (niri is the one that is
tried), PipeWire for the sound mixer, and the
[Monocraft](https://github.com/IdreesInc/Monocraft) Nerd Font.

## Running

```sh
git clone --recurse-submodules git@github.com:twilight-shell/shell.git
cd shell
bin/twilight-shell
```

In niri, start it with the session and bind the launcher to a key:

```kdl
spawn-at-startup "/path/to/shell/bin/twilight-shell"

binds {
    Mod+P { spawn "/path/to/shell/bin/twilight-shell" "ipc" "call" "launcher" "toggle"; }
}
```

On NVIDIA, start it with `__GL_YIELD=USLEEP` in the environment: the driver
otherwise busy-waits on the GPU and burns CPU on every frame.

## Installing

```sh
sudo make install        # the modules to /usr/lib/qt6/qml, twilight-shell to /usr/bin
```

`make install PREFIX=~/.local QMLDIR=~/.local/lib/qt6/qml` puts everything in your
home directory instead.

## IPC

`twilight-shell ipc call ...` talks to the shell that runs.

```sh
twilight-shell ipc call launcher toggle
twilight-shell ipc call popout toggle calendar   # or sound
```

## Settings

One TOML file per component in `~/.config/twilight-shell/`, applied as soon as
it is saved: `theme.toml`, `bar.toml`, `app-launcher.toml`. The keys are in each
component's README.

## Updating

The components are git submodules, each at the commit this shell was tested with.

```sh
git pull --recurse-submodules
git submodule update --remote modules/bar    # take the newest bar
```

## License

MIT, see `LICENSE`.
