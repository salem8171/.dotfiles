# Introduction

This repository is a collection of configurations and scripts, with the purpose
of creating a simple and reproducible working environment based on linux.
The instructions described in this document cover the steps needed to install
on a basic [archlinux installation](https://wiki.archlinux.org/title/installation_guide)
with a non root user configured.

Please read this entire document before making any changes to your system.

# Composition

This is a list of the most important desktop environment components used in
this configuration:
- [i3-gaps](https://github.com/Airblader/i3) (window manager)
- [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) (terminal emulator)
- [neovim](https://neovim.io) (text editor)
- [tint2](https://gitlab.com/o9000/tint2) (taskbar and statusbar)
- [ungoogled-chromium](https://github.com/Eloston/ungoogled-chromium) (web browser)
- [zsh](https://www.zsh.org/) (shell)
- [sxhkd](https://github.com/baskerville/sxhkd) (keyboard shortcut manager)
- [lf](https://github.com/gokcehan/lf) (file manager)
- [xorg](https://www.x.org/wiki/) (display server)
- no display manager
- no compositor
- Monokaish (Custom theme based on Monokai)

# Installation

Clone the repository to the home folder (or anywhere else)

```sh
git clone https://github.com/salem8171/.dotfiles.git $HOME/.dotfiles
```

## Dependencies

Some packages are required to be installed, without them, this configuration
could make the system misbehave or not startup correctly after boot (due to
missing packages for X and login shell setup).

Package names are listed in `dependencies/dependencies.*.txt` files, grouped in
different files depending on how they are installed. It is recommended to check
the contents of these files before installing. The most important packages are
contained in `dependencies.pacman.txt` and `dependencies.aur.txt`.

### Official Repos Packages

Start by installing dependencies from the official repos
(`dependencies.pacman.txt`)

```sh
sudo pacman -Sy - < $HOME/.dotfiles/dependencies/dependencies.pacman.txt
```

### AUR Packages

To install AUR packages, an AUR helper is recommended. In this guide, `yay`
will be used. `yay` itself can be manually installed as an AUR package by
cloning its repo and running `makepkg`.

```sh
mkdir -p $HOME/.cache/yay
git clone https://aur.archlinux.org/yay.git $HOME/.cache/yay/yay
cd $HOME/.cache/yay/yay
makepkg -si
```

Now install AUR dependencies

```sh
yay -Sy - < $HOME.dotfiles/dependencies/dependencies.aur.txt
```

### NPM Packages

Next step would be to install npm packages

```sh
xargs sudo npm install -g < $HOME/.dotfiles/dependencies/dependencies.npm.txt
```

### Multilib Packages

Before installing multilib packages, the `multilib` repository needs to be
enabled in pacman configuration file. This is already preconfigured once system
configuration is installed in later steps (under [Installation (system)](#installation-system)).

Since the multilib dependencies are not urgently required at this point, they
can be installed after finishing with the configuration.

Alternatively, multilib can be configured manually following the instructions
in the Archwiki [here](https://wiki.archlinux.org/title/official_repositories#multilib)

Once multilib is configured, install packages

```sh
sudo pacman -Sy - < $HOME/.dotfiles/dependencies/dependencies.multilib.txt
```

## Login Shell

This configuration uses zsh as the default shell. Therefore, it needs to be
configured as the login shell for the current user

```sh
sudo usermod -s "$(which zsh)" $USER
```

## Configuration Deployment

Create symlinks

```sh
ln -sb $HOME/.dotfiles/.config $HOME/.config
ln -sb $HOME/.dotfiles/.local $HOME/.local
```

Some files/folders were relocated from their default locations, so they also
need to be symlinked

```sh
ln -sb $HOME/.config/zsh/.zprofile $HOME/.zprofile
ln -sb $HOME/.local/share/themes $HOME/.themes
```

XDG Autostart is used to run some programs at startup, enabling autostart is
done via symlinks

```sh
for desktop_file in cbatticon volumeicon copyq-daemon keynav mpd polkit-dumb-agent reload-config sxhkd-daemon tint2 tint2-top transmission-daemon unclutter urxvt-daemon web-patcher
do
  ln -sb $HOME/.local/share/applications/$desktop_file.desktop $HOME/.config/autostart/
done
```

## Installation (system)

Some configuration only make sense to be installed system wide (package manager,
grub, user autologin). Start by switching to the root user and cloning the
repository

```sh
su
git clone https://github.com/salem8171/.dotfiles.git /opt/.dotfiles
```

It is highly recommended to create symlinks manually on a file by file basis to
avoid breaking anything on your system, but if you are feeling adventurous, you
can do that in one go

```sh
cd /opt/.dotfiles
find etc -type f | while read -r file; do
  mkdir -p "$(dirname "/$file")"
  ln -sb "$(pwd)/$file" "/$file"
done
```

At this point pacman is configured to install packages from the `multilib` repo,
if it wasn't done already, [install multilib dependencies](#multilib-packages).

### Autologin

The choices made in this configuration are very opinionated; No display manager
is used, instead, xinit is launched directly from .zprofile on tty1 (already
covered in the previous section), and autologin can optionally be configured.
If you haven't done so already, you need to symlink (or copy) the override to
agetty systemd service

```sh
ln -s /opt/.dotfiles/etc/systemd/system/getty@tty1.service.d/override.conf \
  /etc/systemd/system/getty@tty1.service.d/override.conf
```

The username is currently hardcoded to `salem` and needs to be changed manually
(replace `username` with your username or with `$USER` if you are logged in
with your user instead of `root`)

```sh
sed -i 's/salem/username/' /etc/systemd/system/getty@tty1.service.d/override.conf
```

Finally add your user to the autologin group

```sh
usermod -aG autologin username
```

More information about [autologin](https://wiki.archlinux.org/title/getty#Automatic_login_to_virtual_console)

## Reboot

After installing all the necessary configuration files, double check all the
steps. If everything is verified, reboot the system. It should now boot into
a graphical environment.

## Initialising Tools For First Time Use

Some installed packages need additional setup before they can be used normally.
These are mostly applications which require the use of plugins.

### ZSH

Setting up ZSH is pretty stright forward, simply open up a terminal
(`super+o t`), plugins will be installed automatically.

If for any reason some plugin failed to install, try installing manually with

```sh
antigen bundle plugin_name
```

### Ungoogled Chromium

Chromium, being primarly a GUI application, is not easily configurable using the
command line, and requires a few extra steps to setup.

Start by creating a preferences file from template. This file contains most of
the needed default settings, plus a list of chromium extensions to be installed.
The reason for maintaining a template is that the actual file is modified
excessively by chromium, and it is not a good idea to track.

```sh
cp $HOME/.config/chromium/Default/Preferences.template $HOME/.config/chromium/Default/Preferences
```

Next open chromium (`super+o b r`) to install extensions. Click on the
extensions icon, a popup menu with a list of extensions should appear, look for
`Chromium Web Store` extension, and click on `More actions` (3 dots), then
`Update all extensions`.

This is the list of extensions which will be installed:
- Chromium Web Store
- Dark Reader
- Privacy Badger
- uBlock Origin
- Vimium C
- Violentmonkey

A couple of extensions also need to be configured.

Go to `Extensions` > Violentmonkey > `More actions` > `Options` > `Settings` > `Import from zip`,
then browse for the zip file under `$HOME/.config/violentmonkey/scripts.zip`.

Similarly, go to `Extensions` > Vimium C > `More actions` > Options > `Import Settings`,
then browse for the file `$HOME/.config/vimium/vimium_c.json`.

Additionaly for Vimium, some options need to be set manually, since they are not
imported/exported. In the options window, go under `Advanced Options`, check
everything in the `Optional permissions` section. Save all changes and approve
the permission popup.

### Neovim

Setting up plugins in neovim should be stright forward, open up neovim
(`super+o n`), then execute the vim command
```
:PlugInstall
```

# Usage
(TODO)
