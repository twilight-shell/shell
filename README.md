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
| [notifications](https://github.com/twilight-shell/notifications) | The notification daemon and its cards. |
| [lock](https://github.com/twilight-shell/lock) | The lock screen. |
| [wallpaper](https://github.com/twilight-shell/wallpaper) | The wallpaper, a picture or live stars. |
| [osd](https://github.com/twilight-shell/osd) | The volume pop-up. |
| [settings](https://github.com/twilight-shell/settings) | The settings window: palettes of your own and a page for every component that describes its settings. |
| [mascot](https://github.com/twilight-shell/mascot) | Twilight herself, strolling along the bottom edge. Her sprites are downloaded separately, see its README. |

If you want only one of them, install that one: each README says how.

The shell is the notification daemon, and only one daemon can own the name on the
session bus: stop mako, dunst and the like when you switch to it.

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
    Mod+Alt+Shift+L { spawn "/path/to/shell/bin/twilight-shell" "lock"; }
    Mod+S { spawn "/path/to/shell/bin/twilight-shell" "ipc" "call" "settings" "toggle"; }
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
twilight-shell ipc call wallpaper next           # or prev, set <path>, live stars
twilight-shell ipc call mascot toggle            # or say <text>
twilight-shell ipc call settings toggle          # or open <tab>
```

The lock screen is not part of the running shell: `twilight-shell lock` starts
a process that locks the session and exits once it is unlocked, and
`twilight-shell lock preview` shows the screen without locking. So the shell can
be restarted at any time without touching a lock that is up.

## Settings

One TOML file per component in `~/.config/twilight-shell/`, applied as soon as
it is saved: `theme.toml`, `bar.toml`, `app-launcher.toml`, `lock.toml`,
`wallpaper.toml`, `mascot.toml`. The keys are in each component's README.

A component creates its own file, filled with the defaults, the first time it
starts. `twilight-shell config init` creates all of them at once and leaves the
ones that exist alone.

## Updating

The components are git submodules, each at the commit this shell was tested with.

```sh
git pull --recurse-submodules
git submodule update --remote modules/bar    # take the newest bar
```

## Credits

The mascot's sprites aren't part of this project: its
`scripts/get-sprites.sh` downloads Twilight Sparkle's from
[Desktop Ponies](https://github.com/RoosterDragon/Desktop-Ponies), the work of
RoosterDragon and the many artists who drew and shared them under CC BY-NC-SA
3.0 ([credits](https://github.com/RoosterDragon/Desktop-Ponies/blob/master/Content/credits.txt)).
Thank you. My Little Pony: Friendship is Magic is © Hasbro; this project isn't
affiliated with or endorsed by Hasbro or Desktop Ponies.

The font is [Monocraft](https://github.com/IdreesInc/Monocraft), patched with
Nerd Font symbols.

## License

MIT, see `LICENSE`. The sprites keep their own license, CC BY-NC-SA 3.0.
