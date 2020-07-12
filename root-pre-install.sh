#!/bin/bash

pacman -Syu --noconfirm

pacman -S sudo --noconfirm
sed -i 's/^# \(%wheel ALL=(ALL) ALL\)$/\1/' /etc/sudoers

set -i 's/^#Color$/Color/' /etc/pacman.conf
sed -i '/^\[multilib\]$/, /^Include/ s/^#//' /etc/pacman.conf

echo "New user name: "
read username
useradd -m --shell /usr/bin/zsh $username
usermod -aG wheel $username
