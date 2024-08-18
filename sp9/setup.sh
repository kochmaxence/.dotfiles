#!/usr/bin/env bash
set -euxo pipefail

sudo pacman -Syuu --noconfirm

curl -s https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc |
  sudo pacman-key --add -

sudo pacman-key --finger 56C464BAAC421453
sudo pacman-key --lsign-key 56C464BAAC421453

sudo python setup_pacman_conf.py

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm \
  linux-surface \
  linux-surface-headers \
  iptsd

yay -Sy libwacom-surface

sudo pacman -Sy intel-ucode \
  linux-firmware

sudo python blacklist_kernel_mods.py
