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
# csp  >>> quick print out of disk space in the following format: {used}/{available} (x% used)
alias csp="df -BG | awk 'NR>1 {used += \$3+0; total += \$2+0} END {perc=int(used/total*100); print used \" GB / \" total \" GB (\" perc \"% used)\"}'"

# c >>> clear screen 
alias c="clear"

# yadml >>> opens yadm repo in lazygit
alias yadml="lazygit -ucd .local/share/yadm/lazygit -w ~ -g .local/share/yadm/repo.git"

# ff >>> fastfatch 
alias ff="fastfetch --title-color-user yellow --cpu-temp true --gpu-temp true --disk-use-available true --player-name Spotify"

# exporting the path to custom alias pages along with the default MANPATH
export MANPATH="/usr/share/man:/usr/share/man/custom_man:$MANPATH"


    # Antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load   # grabbing pluggins from .zsh_plugins.txt



# -------------------------------------- syntax highlighting ------------------------------

# plugin location 
source ${ZDOTDIR:-~}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# defining highlighters (shit that gets colors)
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern cursor)

    # Main Highlighters 
fg_main='fg=#ff8feb'                                                        # magenta from starship.toml 
fg_warn='fg=#f6fc47,bold'                                                   # yellow  
fg_sudo='fg=#6bfc3a'

fg_orange='fg=#ffbb5c'

ZSH_HIGHLIGHT_STYLES[default]='fg=white'                                    # everything thats not explicitely mentioned is white 

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=gray'
ZSH_HIGHLIGHT_STYLES[reserved-word]=$fg_main
ZSH_HIGHLIGHT_STYLES[command]=$fg_main                
ZSH_HIGHLIGHT_STYLES[global-alias]=$fg_main  
ZSH_HIGHLIGHT_STYLES[suffix-alias]=$fg_main
ZSH_HIGHLIGHT_STYLES[precommand]=$fg_main
ZSH_HIGHLIGHT_STYLES[arg0]=$fg_main
ZSH_HIGHLIGHT_STYLES[builtin]=$fg_main 
ZSH_HIGHLIGHT_STYLES[alias]=$fg_main                                        # more pinkkkk
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=$fg_orange                       # light orange
ZSH_HIGHLIGHT_STYLES[command-substitution]=$fg_sudo                         # just to make it clear 
ZSH_HIGHLIGHT_STYLES[command-substitution-qouted]=$fg_sudo
ZSH_HIGHLIGHT_STYLES[command-substitution-unqouted]=$fg_sudo
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=$fg_sudo
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-qouted]=$fg_sudo
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unqouted]=$fg_sudo
ZSH_HIGHLIGHT_STYLES[globbing]=$fg_orange
    
    # Bracket Highlighters
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=gray,underline'   # for unmatched bracket 
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=yellow,underline'    # for cursor-over bracket -> signals to matching bracket 
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=$fg_warn

    # Special Patterns Highlighters
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' $fg_warn)                                 # if pattern is matched change the highlighting 
ZSH_HIGHLIGHT_PATTERNS+=('sudo' $fg_sudo)

    # Cursor Highlighter
ZSH_HIGHLIGHT_STYLES[cursor]='fg=white,underline'
# -----------------------------------------------------------------------------------------




