# avoid problems with emacs tramp
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# NOTE that autojump needs the executable autojump installed
# NOTE do NOT enable the tmux plugin! It breaks the last-working-dir functionality
plugins=(last-working-dir zsh-navigation-tools rvm web-search rails bundler ruby git gem git-extras github vi-mode wd fabric docker archlinux colorize)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

DEFAULT_USER="svk"

autoload -U zmv
alias mmv='noglob zmv -W'

autoload znt-history-widget
zle -N znt-history-widget
bindkey "^R" znt-history-widget
zle -N znt-cd-widget
bindkey "^J" znt-cd-widget
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
znt_cd_hotlist=( "~/development/pa/rho" "~/development/pa/psi" "~/development/sc/webapp"
                 "~/development/sc/graphical_client" "~/development/sc/client_server"
               )
# enable rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# tell Java that XMonad is non-reparenting (prevents blank windows of java applications)
export _JAVA_AWT_WM_NONREPARENTING=1


export EDITOR=vim

alias dockercleancontainers="docker ps -a -f status=exited -q | xargs docker rm"
alias dockercleanimages="docker images -f dangling=true -q | xargs docker rmi"
alias dockerclean="dockercleancontainers && dockercleanimages"

# ps + grep.
# see https://github.com/blueyed/oh-my-zsh/blob/a08181210b47625efdc8480e628b0155bff392c9/lib/aliases.zsh#L10-L18
pg() {
  local pids
  pids=$(pgrep -f $@)
  if [[ ! -n $pids ]]; then
    echo "No processes found." >&2; return 1
  fi
  ps up $(pgrep -f $@)
}

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# initialize rbenv (ruby version manager)
eval "$(rbenv init -)"
unalias gr # zsh git plugin defines this alias but we want to use the gr tool
