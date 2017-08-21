# aliases
alias ll='ls -alF'
alias gp='git pull origin --rebase'

# thanks to https://github.com/peterhurford/git-aliases.zsh
clone() {
  if [[ -z $2 ]]; then
    local repo_name=$1
    while [ "${repo_name%%/*}" != "$repo_name" ]; do
       repo_name=${repo_name#*/}
    done

    repo_name=${repo_name%.*}
    git clone $1
  else
    if [[ $# -eq 3 ]]; then
      git clone git@github.com:$1/$2.git $3
    else
      git clone git@github.com:$1/$2.git
    fi
  fi
}