source "$HOME/.zgen/zgen.zsh"
fpath=(~/.zsh/completion $fpath)

MODEM="6735"
ZSH_CUSTOM="$HOME/dotfiles/zsh"

if ! zgen saved; then
	echo "Creating a zgen save"

	# load oh my zsh
	zgen oh-my-zsh

	# load external
	zgen load zsh-users/zsh-autosuggestions
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load hlissner/zsh-autopair
	
	# load theme
	zgen load denysdovhan/spaceship-zsh-theme spaceship

	zgen save
fi

# theme override
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PROMPT_SYMBOL="λ"
SPACESHIP_KUBECONTEXT_SHOW=false

alias ll='ls -alF'

export VISUAL="vim"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)
export PATH=$PATH:/home/lholznagel/.local/bin
gpg-connect-agent updatestartuptty /bye >/dev/null

