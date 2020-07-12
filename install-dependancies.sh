#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git binutils fakeroot gcc go make

YAY_CACHE_DIR=$HOME/.cache/yay
mkdir -p $YAY_CACHE_DIR
git clone https://aur.archlinux.org/yay.git $YAY_CACHE_DIR/yay
cd $YAY_CACHE_DIR/yay
makepkg -si

cd $(dirname $0)

xargs yay -S --noconfirm <dependencies.txt
