source "$HOME/.zgen/zgen.zsh"
fpath=(~/.zsh/completion $fpath)

ZSH_CUSTOM="$HOME/dotfiles/zsh"

if ! zgen saved; then
	echo "Creating a zgen save"

	# load oh my zsh
	zgen oh-my-zsh

	# load external
	zgen load zsh-users/zsh-autosuggestions
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load hlissner/zsh-autopair
  zgen oh-my-zsh plugins/tmux
	
	# load theme
	zgen load denysdovhan/spaceship-zsh-theme spaceship

	zgen save
fi

# theme override
SPACESHIP_CHAR_SYMBOL="λ "

alias cat='bat'
alias ll='exa -al'
alias vim='nvim'
alias maintenance='$HOME/dotfiles/scripts/maintenance.sh'

export LD_LIBRARY_PATH=/usr/local/lib
export Path=$PATH:/home/lholznagel/.local/bin:/home/lholznagel/.cargo/bin
export VISUAL="vim"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

