# Get the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set up colors so tmux doesn't die
export TERM=xterm-256color

# autoload vcs
autoload -Uz vcs_info
precmd() {
  vcs_info
}

zstyle ':vcs_info:git*' formats "[%b] %a"


# Set up theme
ZSH_THEME="doubleend"

# Set up plugins
plugins=(git)

# Make sure prompt is set to autoload
autoload -U promptinit
promptinit

# Set up colors 
autoload -U colors && colors

# Set up custom prompt
setopt prompt_subst

RPROMPT="%{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}"

PROMPT="%{$fg[white]%}┌[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}]─[%{$fg[green]%}%d%{$reset_color%}]
└─╼ "


