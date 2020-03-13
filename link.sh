BASE=/home/$(whoami)/dotfiles
CONFIG_DEST=/home/$(whoami)/.config

cd $CONFIG_DEST && ln -sf $BASE/.config/alacritty
cd $CONFIG_DEST && ln -sf $BASE/.config/i3
cd $CONFIG_DEST && ln -sf $BASE/.config/polybar
cd $CONFIG_DEST && ln -sf $BASE/.config/rofi

cd /usr/share/rofi/themes && sudo ln -sf $BASE/custom-nord.rasi

cd /home/$(whoami) && ln -sf $BASE/.vimrc
cd /home/$(whoami) && ln -sf $BASE/.Xresources
cd /home/$(whoami) && ln -sf $BASE/.zshrc
