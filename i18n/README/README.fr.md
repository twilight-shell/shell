<h1 align="center">twilight-shell</h1>

<p align="center">
Un bureau pour Wayland, fait de morceaux qui vivent chacun dans leur propre dépôt et s'installent séparément.<br> Construit avec <a href="https://quickshell.org">Quickshell</a>, peint comme un ciel nocturne au-dessus de Ponyville.
</p>

<p align="center">
  <a href="https://github.com/twilight-shell/shell/actions/workflows/ci.yml"><img src="https://github.com/twilight-shell/shell/actions/workflows/ci.yml/badge.svg" alt="ci"></a>
  <a href="https://github.com/twilight-shell/shell/releases"><img src="https://img.shields.io/github/v/release/twilight-shell/shell" alt="release"></a>
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/twilight-shell/shell" alt="license"></a>
</p>

<!-- lang:start -->
<p align="center">
  <a href="../../README.md">English</a> ·
  <a href="README.ru.md">Русский</a> ·
  <a href="README.uk.md">Українська</a> ·
  <a href="README.de.md">Deutsch</a> ·
  <b>Français</b> ·
  <a href="README.es.md">Español</a> ·
  <a href="README.pt-BR.md">Português</a> ·
  <a href="README.it.md">Italiano</a> ·
  <a href="README.zh-CN.md">简体中文</a> ·
  <a href="README.ja.md">日本語</a> ·
  <a href="README.ko.md">한국어</a>
</p>
<!-- lang:end -->

<p align="center">
  <img src="../../docs/images/hero.png" alt="The shell: live star wallpaper, the bar, the volume pop-up and Twilight the mascot" width="100%">
</p>

## Sommaire

<!-- toc:start -->
- [Ce que c'est](#ce-que-cest)
- [Aperçu](#aperçu)
- [Captures d'écran](#captures-décran)
  - [La barre](#la-barre)
  - [Le lanceur](#le-lanceur)
  - [Les cartes volantes](#les-cartes-volantes)
  - [Notifications et indicateur de volume](#notifications-et-indicateur-de-volume)
  - [L'écran de verrouillage](#lécran-de-verrouillage)
  - [La mascotte](#la-mascotte)
  - [Le fond d'écran et les palettes](#le-fond-décran-et-les-palettes)
  - [La fenêtre de réglages](#la-fenêtre-de-réglages)
  - [Plugins](#plugins)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Lancement](#lancement)
- [Utilisation](#utilisation)
- [Réglages](#réglages)
- [Composants](#composants)
- [Plugins](#plugins-1)
- [Dépannage](#dépannage)
- [Mise à jour](#mise-à-jour)
- [Contribuer](#contribuer)
- [Remerciements](#remerciements)
- [Licence](#licence)
<!-- toc:end -->

## Ce que c'est

Une barre, un lanceur, des notifications, un écran de verrouillage, un fond d'écran, une mascotte, une fenêtre de réglages et des plugins, tous dessinés dans le même style d'autocollants qui suit une seule palette.

- **Des morceaux, pas un bloc.** Chaque composant est un dépôt à part, qui fonctionne seul et s'installe seul. Vous ne voulez que le lanceur ? N'installez que le lanceur. La barre ne vous plaît pas ? Laissez-la de côté. Ce dépôt ne fait que les assembler.
- **Les réglages sont de simples fichiers TOML** dans `~/.config/twilight-shell/`, créés à partir des valeurs par défaut au premier lancement d'un composant et appliqués dès que vous les enregistrez. Ou utilisez la fenêtre de réglages.
- **Extensible.** Un plugin est un dossier avec un `plugin.toml` et un peu de QML. Il peut dessiner des fenêtres, répondre à des appels IPC, mettre un îlot dans la barre et obtenir une page dans la fenêtre de réglages.
- **Pas lié à un seul compositeur.** Il tourne aujourd'hui sur [niri](https://github.com/YaLTeR/niri). Tout ce qui parle au compositeur passe par un petit module, si bien que d'autres peuvent suivre.

## Aperçu

<p align="center">
  <a href="../../docs/media/preview.mp4"><img src="../../docs/images/preview-poster.png" alt="Watch the preview video" width="80%"></a>
</p>

Une courte visite : le lanceur, le calendrier et le mixeur de son, les notifications, l'indicateur de volume, la fenêtre de réglages et l'écran de verrouillage. Cliquez sur l'image pour lancer la vidéo.

## Captures d'écran

### La barre

Des îlots flottants le long du haut de chaque écran : le bouton du lanceur, les espaces de travail, la fenêtre active, une horloge (24 heures ou AM/PM, avec ou sans secondes), la disposition du clavier, la zone de notification et le volume. Les plugins peuvent ajouter leurs propres îlots.

<img src="../../docs/images/bar.png" alt="The bar" width="100%">

### Le lanceur

« Twilight's Library » : une carte de grimoire sur un ciel de nuit. Tapez pour chercher, et il trouve Firefox même si vous l'avez tapé avec la mauvaise disposition de clavier.

<img src="../../docs/images/launcher.png" alt="The launcher" width="100%">

### Les cartes volantes

Des cartes qui tombent de la barre : un calendrier avec la phase de la lune sous l'horloge, et un mixeur de son sous le volume avec chaque sortie, entrée et application.

<img src="../../docs/images/calendar.png" alt="The calendar" height="440"> <img src="../../docs/images/sound.png" alt="The sound mixer" height="440">

### Notifications et indicateur de volume

Le démon de notifications : actions, urgence, une mèche qui se consume tant qu'une carte est affichée, et des cartes qui cèdent la place aux cartes volantes. Et l'indicateur qui monte du bord inférieur quand le volume change.

<img src="../../docs/images/notifications.png" alt="A stack of notifications: normal, with actions, and urgent" width="460">

<img src="../../docs/images/osd-volume.png" alt="The volume pop-up" width="300"> <img src="../../docs/images/osd-muted.png" alt="The volume pop-up when muted" width="300">

### L'écran de verrouillage

Un processus à part qui n'existe que tant que la session est verrouillée : le mot de passe passe par PAM, la disposition du clavier est affichée pour ne pas le taper dans la mauvaise, et un mauvais mot de passe fait trembler la carte.

<img src="../../docs/images/lock.png" alt="The lock screen" width="100%">

### La mascotte

Twilight vit dans un coin de l'écran. Elle se promène le long du bord inférieur, parle dans une bulle, danse quand la musique joue, s'assoupit tard dans la nuit et peut être soulevée et lancée. Ses sprites ne font pas partie du dépôt : le dépôt [mascot](https://github.com/twilight-shell/mascot) a un script qui les télécharge, avec les crédits.

<img src="../../docs/images/mascot-say.png" alt="Twilight says something" width="300"> <img src="../../docs/images/mascot-bubble.png" alt="Twilight in the corner" width="300">

### Le fond d'écran et les palettes

Une image dévoilée par un cercle qui grandit, ou un mur de LED d'étoiles qui dérivent et scintillent aux couleurs de la palette. La palette est l'une des palettes prêtes, l'une des vôtres, ou les couleurs du fond d'écran :

<img src="../../docs/images/palette-twilight.png" alt="Twilight palette" width="32%"> <img src="../../docs/images/palette-luna.png" alt="Luna palette" width="32%"> <img src="../../docs/images/palette-rarity.png" alt="Rarity palette" width="32%">
<img src="../../docs/images/palette-pinkie.png" alt="Pinkie palette" width="32%"> <img src="../../docs/images/palette-celestia.png" alt="Celestia palette" width="32%"> <img src="../../docs/images/palette-fluttershy.png" alt="Fluttershy palette" width="32%">
<img src="../../docs/images/palette-rainbow.png" alt="Rainbow palette" width="32%"> <img src="../../docs/images/palette-wallpaper.png" alt="Palette taken from a wallpaper" width="32%"> <img src="../../docs/images/palette-mine.png" alt="A palette of your own" width="32%">

### La fenêtre de réglages

Une page pour chaque composant qui décrit ses réglages : rien à enregistrer, et un plugin obtient sa page de la même façon. La page des palettes permet de créer sa propre palette avec un sélecteur de couleur.

<img src="../../docs/images/settings-appearance.png" alt="Settings: palettes" width="49%"> <img src="../../docs/images/settings-wallpaper.png" alt="Settings: wallpaper" width="49%">
<img src="../../docs/images/settings-bar.png" alt="Settings: the bar" width="49%"> <img src="../../docs/images/settings-launcher.png" alt="Settings: the launcher" width="49%">
<img src="../../docs/images/settings-mascot.png" alt="Settings: the mascot" width="49%"> <img src="../../docs/images/settings-lock.png" alt="Settings: the lock screen" width="49%">

### Plugins

<img src="../../docs/images/settings-plugins.png" alt="Settings: plugins" width="49%"> <img src="../../docs/images/plugin-card.png" alt="The plugin template, running" width="49%">

## Prérequis

- [Quickshell](https://quickshell.org) 0.3 ou plus récent (il apporte Qt 6).
- Un compositeur Wayland. Les espaces de travail, la fenêtre active et la disposition du clavier ne sont connus que pour [niri](https://github.com/YaLTeR/niri) pour l'instant ; l'écran de verrouillage a besoin de `ext-session-lock-v1` (niri, Hyprland, Sway et d'autres l'ont).
- PipeWire, pour le mixeur de son, l'indicateur de volume et l'îlot du volume.
- PAM, pour l'écran de verrouillage.
- `git` et `make` pour l'installer depuis un clone.
- Facultatif : la police [Monocraft](https://github.com/IdreesInc/Monocraft) Nerd Font (la police du système est utilisée sans elle) et `curl`, pour le script qui télécharge les sprites de la mascotte.

## Installation

Tout, avec le shell qui l'assemble :

```sh
git clone --recurse-submodules https://github.com/twilight-shell/shell.git
cd shell
sudo make install        # the modules to /usr/lib/qt6/qml, twilight-shell to /usr/bin
```

`make install PREFIX=~/.local QMLDIR=~/.local/lib/qt6/qml` met tout dans votre dossier personnel à la place.

Pour n'installer que certains composants, dites lesquels, et ce dont ils ont besoin vient avec :

```sh
sudo make install ONLY="bar"                 # the bar, with core and compositor
sudo make install ONLY="app-launcher lock"   # two, with core
```

Sans le shell qui les assemble (ni `twilight-shell`, ni `shell.qml`), chacun fonctionne seul : `qs -p /path/to/bar`. Ce dont un composant a besoin figure dans le fichier `DEPENDS` de son dépôt, et son propre `make install` le dit quand quelque chose manque.

Pour l'essayer sans l'installer, lancez-le depuis le clone : `bin/twilight-shell`.

## Lancement

Lancez-le avec votre session. Dans niri :

```kdl
spawn-at-startup "twilight-shell"

binds {
    Mod+P repeat=false { spawn "twilight-shell" "ipc" "call" "launcher" "toggle"; }
    Mod+S repeat=false { spawn "twilight-shell" "ipc" "call" "settings" "toggle"; }
    Mod+Alt+Shift+L repeat=false { spawn "twilight-shell" "lock"; }
}
```

Le shell est le démon de notifications, et un seul démon peut posséder le nom sur le bus de session : arrêtez mako, dunst et les autres quand vous passez dessus.

Sous NVIDIA, lancez-le avec `__GL_YIELD=USLEEP` dans l'environnement (`spawn-at-startup "env" "__GL_YIELD=USLEEP" "twilight-shell"`) : sinon le pilote attend le GPU en boucle active et consomme du processeur à chaque image.

Le premier lancement crée un fichier de réglages pour chaque composant dans `~/.config/twilight-shell/`. Les images du fond d'écran vont dans `~/Pictures/Wallpapers`. Pour la mascotte, téléchargez une fois ses sprites :

```sh
modules/mascot/scripts/get-sprites.sh        # from the checkout; the folder can be changed in mascot.toml
```

## Utilisation

`twilight-shell ipc call ...` parle au shell en cours d'exécution.

| | |
|---|---|
| `launcher toggle` | Ouvrir et fermer le lanceur. |
| `popout toggle calendar` | Le calendrier ; `sound` pour le mixeur. |
| `settings toggle` | La fenêtre de réglages ; `settings open <tab>` ouvre un onglet. |
| `wallpaper next` | L'image suivante ; `prev`, `set <path>`, `palette <name>`, `live stars` (ou `live ""`). |
| `mascot toggle` | La faire sortir de la vue et revenir ; `mascot say <text>` la fait parler. |
| `plugins list` | Les plugins et ce qui ne va pas avec eux ; `plugins scan`, `plugins reload`. |

Autres commandes du script de lancement :

| | |
|---|---|
| `twilight-shell lock` | Verrouiller la session. Un processus à part qui se termine quand vous déverrouillez. |
| `twilight-shell lock preview` | Afficher l'écran de verrouillage sans rien verrouiller. Échap le ferme. |
| `twilight-shell config init` | Créer le fichier de réglages de chaque composant qui n'en a pas encore. |

## Réglages

Un fichier TOML par composant dans `~/.config/twilight-shell/`, appliqué dès qu'il est enregistré. Les commentaires et la mise en page survivent quand le shell réécrit une valeur. La fenêtre et les fichiers modifient la même chose.

| Fichier | Contenu |
|---|---|
| `theme.toml` | `palette` (une palette prête, `wallpaper`, ou l'une des vôtres), `wallpaper` et vos propres `[palettes.<name>]`. |
| `bar.toml` | `window-title`, et `[clock]` avec `hour24` et `seconds`. |
| `app-launcher.toml` | `terminal`, la commande qui lance les applications de terminal. |
| `lock.toml` | `pam`, le service PAM auprès duquel le mot de passe est vérifié. |
| `wallpaper.toml` | `dir`, `live`, et `[stars]` avec `dot`, `cell`, `speed` et `glow`. |
| `mascot.toml` | `enabled`, `sprites`, `music`, `sleep`, `chatter`. |
| `plugins.toml` | `dirs`, où l'on cherche les plugins, et `enabled`, ceux qui tournent. |

Une palette à vous est une table dans `theme.toml` :

```toml
palette = "mine"

[palettes.mine]
name = "Mine"
base = "#2a4b3a"        # tints the background and the surfaces
primary = "#9be3b0"     # primary, accent and secondary are used as they are
accent = "#f2b84b"
secondary = "#3f8f7a"
```

Chaque composant décrit ses clés dans son README.

## Composants

Chaque composant est son propre dépôt, avec sa propre version. Ce dépôt pointe chacun vers le commit qui a été testé avec les autres.

```mermaid
graph LR
  shell --> bar & launcher[app-launcher] & popouts & notifications & lock & wallpaper & osd & mascot & settings & plugins
  bar --> core & compositor
  launcher --> core
  popouts --> core
  notifications --> core
  lock --> core
  lock -.-> compositor
  wallpaper --> core
  osd --> core
  mascot --> core
  settings --> core
  plugins --> core
```

| | |
|---|---|
| [core](https://github.com/twilight-shell/core) | Le thème, les palettes, la boîte à outils d'interface en autocollants, les fichiers de réglages. Tous les autres composants en ont besoin. |
| [compositor](https://github.com/twilight-shell/compositor) | Espaces de travail, fenêtre active et disposition du clavier, les mêmes pour tout compositeur (niri pour l'instant). |
| [bar](https://github.com/twilight-shell/bar) | La barre. |
| [app-launcher](https://github.com/twilight-shell/app-launcher) | « Twilight's Library », le lanceur d'applications. |
| [popouts](https://github.com/twilight-shell/popouts) | Le calendrier et le mixeur de son qui tombent de la barre. |
| [notifications](https://github.com/twilight-shell/notifications) | Le démon de notifications et ses cartes. |
| [lock](https://github.com/twilight-shell/lock) | L'écran de verrouillage. |
| [wallpaper](https://github.com/twilight-shell/wallpaper) | Le fond d'écran, une image ou des étoiles vivantes. |
| [osd](https://github.com/twilight-shell/osd) | L'indicateur de volume. |
| [mascot](https://github.com/twilight-shell/mascot) | Twilight elle-même, qui se promène le long du bord inférieur. Ses sprites se téléchargent à part. |
| [settings](https://github.com/twilight-shell/settings) | La fenêtre de réglages : des palettes à vous, et une page pour chaque composant qui décrit ses réglages. |
| [plugins](https://github.com/twilight-shell/plugins) | Trouve les plugins et lance ceux qui sont activés. |
| [plugin-template](https://github.com/twilight-shell/plugin-template) | Un plugin pour commencer. |

## Plugins

Un plugin est un dossier avec un `plugin.toml` et un peu de QML. Il peut dessiner des fenêtres, répondre à des appels IPC, mettre un îlot dans la barre et avoir une page dans la fenêtre de réglages. Rien ne tourne tant que vous ne l'activez pas dans la fenêtre de réglages ou dans `plugins.toml`. Partez du [plugin-template](https://github.com/twilight-shell/plugin-template), et lisez comment tout cela fonctionne dans [plugins](https://github.com/twilight-shell/plugins).

```sh
git clone https://github.com/twilight-shell/plugin-template.git ~/.local/share/twilight-shell/plugins/my-plugin
```

Un plugin est du code qui s'exécute avec vos droits, et il n'y a pas de bac à sable. N'activez que ceux en qui vous avez confiance.

## Dépannage

**`module "Twilight.Core" is not installed`.** Le module n'est pas dans un dossier que Qt parcourt. Lancez depuis un clone avec `bin/twilight-shell` (il règle le chemin), installez les modules (`make install`), ou faites pointer `QML_IMPORT_PATH` vers les dossiers parents des modules, en chemins complets séparés par `:`. Dans fish, écrivez `$HOME` : il ne développe pas `~` après un deux-points.

**Pas de notifications, ou elles viennent d'un autre programme.** Un seul démon peut posséder `org.freedesktop.Notifications`. Arrêtez mako, dunst et les autres ; mako revient tout seul par activation D-Bus quand le nom est libre, supprimez donc son lancement automatique. Voir qui a le nom : `busctl --user list | grep Notifications`.

**Le processeur est occupé sous NVIDIA.** Lancez le shell avec `__GL_YIELD=USLEEP` dans l'environnement.

**La mascotte n'apparaît pas.** Elle a besoin de ses sprites : lancez `modules/mascot/scripts/get-sprites.sh` (ou celui du dépôt mascot) et vérifiez `sprites` dans `mascot.toml`.

**Un composant n'a pas de page dans la fenêtre de réglages.** La fenêtre trouve les fichiers `*.schema.toml` des composants dans `QML_IMPORT_PATH` et dans le dossier où les modules sont installés. Un composant sans schéma n'a pas de page.

**Un nouveau composant ou plugin n'apparaît pas.** La liste des dossiers de modules est lue au démarrage du shell : redémarrez-le. Un dossier de plugin ajouté ou supprimé est remarqué tout seul ; `twilight-shell ipc call plugins list` dit ce qu'il voit.

**L'écran reste verrouillé.** Si le processus de verrouillage meurt, le compositeur garde la session verrouillée, c'est le but. Passez sur un TTY (Ctrl+Alt+F2), connectez-vous, et lancez un verrouilleur pour cette session, ou redémarrez le compositeur.

## Mise à jour

```sh
git pull --recurse-submodules
sudo make install
qs -p /usr/share/twilight-shell kill && twilight-shell
```

Chaque dépôt a sa propre version ([gestion sémantique de version](https://semver.org), un tag `v0.1.0` pour chaque release, un `CHANGELOG.md` qui dit ce qu'il contient). Une release du shell est un ensemble de composants testés ensemble : les sous-modules pointent vers leurs commits, et ceci montre quelles versions ils sont :

```sh
git submodule foreach 'git describe --tags --always'
```

Pour le supprimer : `sudo make uninstall`.

## Contribuer

Les rapports de bugs, les idées, la documentation et les plugins sont tous bienvenus. Lisez [CONTRIBUTING.md](../../CONTRIBUTING.md) et, si vous êtes un agent, [AGENTS.md](../../AGENTS.md). Nous suivons le [Code de conduite](https://github.com/twilight-shell/.github/blob/main/CODE_OF_CONDUCT.md) ; les problèmes de sécurité se signalent en privé, voir [SECURITY.md](https://github.com/twilight-shell/.github/blob/main/SECURITY.md).

## Remerciements

Les sprites de la mascotte ne font pas partie de ce projet : le script `get-sprites.sh` du dépôt mascot télécharge ceux de Twilight Sparkle depuis [Desktop Ponies](https://github.com/RoosterDragon/Desktop-Ponies), le travail de RoosterDragon et des nombreux artistes qui les ont dessinés et partagés sous CC BY-NC-SA 3.0 ([crédits](https://github.com/RoosterDragon/Desktop-Ponies/blob/master/Content/credits.txt)). Merci. My Little Pony: Friendship is Magic est © Hasbro ; ce projet n'est ni affilié à Hasbro ou Desktop Ponies ni approuvé par eux. La police est [Monocraft](https://github.com/IdreesInc/Monocraft), patchée avec les symboles Nerd Font.

## Licence

MIT, voir [LICENSE](../../LICENSE). Les sprites gardent leur propre licence, CC BY-NC-SA 3.0.
