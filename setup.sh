#!/usr/bin/env bash
set -euxo pipefail

sudo pacman -Syuu --noconfirm
sudo pacman -Sy --noconfirm yay \
  snapd \
  neovim \
  wl-clipboard \
  kitty \
  base-devel \
  ripgrep \
  luarocks \
  fd \
  lazygit \
  tree-sitter

sudo systemctl enable --now snapd.socket
sudo systemctl enable --now snapd.apparmor.service

sudo ln -sf /var/lib/snapd/snap /snap

ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/.zshenv $HOME/.zshenv
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim

# Install Node through NVM
PROFILE=/dev/null bash -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash"
set +x
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 22

set -x

# Install Rust through rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
