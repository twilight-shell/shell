//@ pragma UseQApplication

import Quickshell
import Twilight.Bar
import Twilight.Compositor
import Twilight.Launcher
import Twilight.Mascot
import Twilight.Notifications
import Twilight.Osd
import Twilight.Popouts
import Twilight.Wallpaper

// The twilight shell: every component stands on its own, and this is where
// they are connected. The bar asks, the others open.
ShellRoot {
    Wallpaper {}

    Bar {
        activePopout: popouts.open
        launcherOpen: launcher.opened

        onPopoutRequested: name => popouts.toggle(name)
        onLauncherRequested: launcher.toggle()
    }

    Launcher {
        id: launcher

        outputName: Compositor.focusedOutput
    }

    Popouts {
        id: popouts

        outputName: Compositor.focusedOutput
    }

    Notifications {
        outputName: Compositor.focusedOutput
        avoid: popouts.push
    }

    Osd {
        outputName: Compositor.focusedOutput
    }

    Mascot {
        outputName: Compositor.focusedOutput
    }
}
