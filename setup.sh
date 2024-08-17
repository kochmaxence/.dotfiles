#!/usr/bin/env bash
set -euxo pipefail

sudo pacman -Syuu
sudo pacman -Sy yay \
  snapd \
  neovim \
  wl-clipboard \
  kitty \
  base-devel

sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service

sudo ln -sf /var/lib/snapd/snap /snap

ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim
