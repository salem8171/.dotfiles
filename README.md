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

Package names are listed in `dependencies.*.txt` files, grouped in different
files depending on how they are installed. It is recommended to check the
contents of these files before installing. The most important packages are
contained in `dependencies.pacman.txt` and `dependencies.aur.txt`.

### Official Repos Packages

Start by installing dependencies from the official repos
(`dependencies.pacman.txt`)

```sh
sudo pacman -Sy - < $HOME/.dotfiles/dependencies.pacman.txt
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
yay -Sy - < $HOME.dotfiles/dependencies.aur.txt
```

### NPM Packages

Next step would be to install npm packages

```sh
xargs sudo npm install -g < $HOME/.dotfiles/dependencies.npm.txt
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
sudo pacman -Sy - < $HOME/.dotfiles/dependencies.multilib.txt
```

## Login Shell

This configuration uses zsh as the default shell. Therefore, it needs to be
configured as the login shell for the current user

```sh
sudo usermod -s "$(which zsh)" $USER
```

## Create backups

Create backups (optional but highly recommended).
Skip this step if only partial installation is needed (e.g. creating symlinks
for specific files rather than the whole config folders)

```sh
mv $HOME/.config $HOME/.config.bak
mv $HOME/.local $HOME/.local.bak
```

## Configuration Deployment

Create symlinks

```sh
ln -s $HOME/.dotfiles/.config $HOME/.config
ln -s $HOME/.dotfiles/.local $HOME/.local
```

Some files/folders were relocated from their default locations, so they also
need to be symlinked

```sh
ln -s $HOME/.config/zsh/.zprofile $HOME/.zprofile
ln -s $HOME/.local/share/themes $HOME/.themes
```

XDG Autostart is used to run some programs at startup, enabling autostart is
done via symlinks

```sh
for desktop_file in (
  cbatticon copyq-daemon keynav mpd reload-config sxhkd-daemon tint2 tint2-top
  transmission-daemon unclutter urxvt-daemon web-patcher)
do
  ln -s $HOME/.local/share/applications/$deskopt_file.desktop $HOME/.config/autostart/
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

# Usage
(TODO)
