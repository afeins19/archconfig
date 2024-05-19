# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aaron/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

    # Starship Configuration 
eval "$(starship init zsh)"


    # Custon Aliases
# CSP  >>> quick print out of disk space in the following format: {used}/{available} (x% used)
alias csp="df -BG | awk 'NR>1 {used += \$3+0; total += \$2+0} END {perc=int(used/total*100); print used \" GB / \" total \" GB (\" perc \"% used)\"}'"

# yadml >>> opens yadm repo in lazygit
alias yadml="lazygit -ucd .local/share/yadm/lazygit -w ~ -g .local/share/yadm/repo.git"

# ff >>> fastfatch 
alias ff="fastfetch --title-color-user yellow --cpu-temp true --gpu-temp true --disk-use-available true --player-name Spotify"

# exporting the path to custom alias pages along with the default MANPATH
export MANPATH="/usr/share/man:/usr/share/man/custom_man:$MANPATH"


    # Antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load   # grabbing pluggins from .zsh_plugins.txt



    # syntax highlighting 
  # points fast syntax highlighting to the overlay.ini file which makes a few small changes to the syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor)
# ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main pattern cursor)       # setting all highliters to be used 

#ZSH_HIGHLIGHT_STYLES[default]='fg=cyan'