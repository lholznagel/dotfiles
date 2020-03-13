#!/bin/bash

# get latest rmshit version
mkdir tmp
wget -qO $HOME/dotfiles/tmp/rmshit.py https://raw.githubusercontent.com/lahwaacz/Scripts/master/rmshit.py

# rust
rustup update
cargo install hexyl
cargo install tokei
cargo install bat
cargo install exa

# update
yaourt -Syyu

# remove orphans
sudo pacman -Rns $(pacman -Qtdq) || true

# list all packages and put them into tmp
pacman -Qqe > /tmp/pkglist.txt
find / -xtype l -print 2>/dev/null > /tmp/broken_symlinks

# scripts
python3 $HOME/dotfiles/tmp/rmshit.py
