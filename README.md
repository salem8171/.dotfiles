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

# Dependencies
(TODO)
