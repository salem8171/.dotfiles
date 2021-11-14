# Installation

Clone the repository to the home folder (or anywhere else, doesn't matter)

```sh
git clone https://github.com/salem8171/.dotfiles.git $HOME/.dotfiles
```

Create backups (optional but highly recommended)
Skip this step if only partial installation is needed (e.g. creating symlinks
for specific files rather than the whole config folders)

```sh
mv $HOME/.config $HOME/.config.bak
mv $HOME/.local $HOME/.local.bak
```

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

# Installation (system)

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

## Autologin

The choices made in this configuration are very opinionated; No display manager
is used, instead, xinit is launched directly from .zprofile on tty1 (already
covered in the previous section), and autologin can be optionally be configured.
If you haven't done so already, you need to symlink (or copy) the override to
agetty systemd service

```sh
ln -s /opt/.dotfiles/etc/systemd/system/getty@tty1.service.d/override.conf \
  /etc/systemd/system/getty@tty1.service.d/override.conf
```

Unfortuantely the username is currently hardcoded to `salem` and needs to be
changed manually (replace `you` with your username or with `$USER` if you are
logged in with your user instead of `root`)

```sh
sed -i 's/salem/you/' /etc/systemd/system/getty@tty1.service.d/override.conf
```

Finally add your user to the autologin group

```sh
usermod -aG autologin you
```

More information about [autologin](https://wiki.archlinux.org/title/getty#Automatic_login_to_virtual_console)

# Dependencies
(TODO)
