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

# -------------------------------------- Custon Aliases--------------------------------------

# bs >>> starts bashtop 
alias bs="bashtop"

# csp  >>> quick print out of disk space in the following format: {used}/{available} (x% used)
alias csp="df -BG | awk 'NR>1 {used += \$3+0; total += \$2+0} END {perc=int(used/total*100); print used \" GB / \" total \" GB (\" perc \"% used)\"}'"

# c >>> clear screen 
alias c="clear"

# cdd >> equivalent to cd ..
alias cdd="cd .."

# cpr >> equivalent to cp -r 
alias cpr="cp -r"

# yadml >>> opens yadm repo in lazygit
alias yadml="lazygit -ucd .local/share/yadm/lazygit -w ~ -g .local/share/yadm/repo.git"

# ff >>> fastfatch 
alias ff="fastfetch --title-color-user white --cpu-temp true --gpu-temp true --disk-use-available true --player-name Spotify"

# wtr >> gets weather by calling a custom script: $HOME/.config/zsh/.scripts/weather.sh
alias wtr="$HOME/.config/zsh/.scripts/weather.sh"

# png >> test ping to www.google.com with a reasonable time and count
alias png="ping www.google.com -c5"

# pacup >> updates the local db for files and then finds which ones are out of date
alias pacup="sudo pacman -Sy && pacman -Qu && echo 'Updates: $(pacman -Qu | wc -l)'"

# paclist >> sudo pacman -Qe ... lists all pacman packages 
alias paclist="pacman -Qe && echo 'Total: $(pacman -Qe | wc -l)'"

# wbr >> killall waybar && waybar & disown -> restarts waybar but disowns the child process from the terminal that spawned it 
alias wbr="killall waybar && waybar & disown"

# pacfind >> sudo pacman -Qe | grep $1 -> finds if a specific package exists 
pacfind() {
    pacman -Qe | grep "$1"
}

# pp >> pretty print | custom fancy printer 
pp() {
    clear && figlet -f lean -c -p $1 | lolcat -a -s 75  
}

# zsrc >> source the .zshrc file 
alias zsrc="source ~/.config/zsh/.zshrc"

# sdn >> shutdown now safely (-p flag) 
alias sdn="uptime -p && sleep 2 && shutdown -P now"

# imgconvert >> convert an image using ffmpeg 
alias imgconvert="function _imgconvert() { ffmpeg -i \$1 -pix_fmt rgb24  \${@:2}; }; _imgconvert"

# wcl >> counts the number of files in the directory 
alias wcl='echo "Items in file: $(( $(ls -l | wc -l) -1 ))"'

# donut >> runs donut.py 
alias donut='cd ~/Projects/donut && poetry shell && python -m donut.py'

# lssh >> cats the output of the ssh config to get ip aliases
alias lssh='cat ~/.ssh/config'

# Git Shorthand Commands >> Abbreviated git commands (all start with 'g') 
alias gstatus='git status' 
alias gcommit='git commit'
alias gadd='git add'
alias gpull='git pull'
alias gpush='git push' 
alias gfetch='git fetch' 
alias gbranch='git branch'
alias gco='git checkout'

# nmsn >> nmap -sn '<current_ip_address>' (gets the current ip and scans the network for devices using nmap)
alias nmsn='nmap -sn $(ip addr show wlo1 | grep "inet " | awk "{print \$2}" | head -n 1)' 


# wifistatus >> nmcli dev wifi | grep '\*' - (first it gets the column names) and then gets the currently connected wifi network stats (if connected)
alias wifistatus="nmcli dev wifi | awk 'NR==1 || /^\*/'" 

#alias wifistatus="nmcli --color yes dev wifi | awk 'BEGIN {found=0} NR==1 {header=$0} /^\*/ {found=1; print header; print $0} END {if (!found) print \"none\"}'; echo; echo \"Ping test:\"; ping -c 3 www.google.com | awk -F'=' '/time=/ {print \$4} END {if (NR > 0) print \"Average latency: \" sum/NR \" ms\"}' sum=0 NR=0"

# .zshrc file commands

# zvim >> edit the .zshrc file with nvim 
alias zvim='sudo nvim ~/.config/zsh/.zshrc' 

# rbt >>> reboot 
alias rbt='reboot'

# pwgensecure >>> pwgen -1 16

alias pwgensecure='pwgen -1 16'
# -------------------------------------- Exports --------------------------------------

# exporting the path to custom alias pages along with the default MANPATH
export MANPATH="/usr/share/man:/usr/share/man/custom_man:$MANPATH"

# exporting Global Environtment Variables for Scripts
export LOCATION="Warminster,PA"
export WORK_EMAIL="afeinberg35@gmail.com"
export MAIN_EMAIL="aaronman227@gmail.com"

    # Antidote

source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load   # grabbing pluggins from .zsh_plugins.txt

    # Spicetify
export PATH="$HOME/.spicety:$PATH"
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# -------------------------------------- syntax highlighting --------------------------------------

# plugin location 
source ${ZDOTDIR:-~}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# defining highlighters (shit that gets colors)
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern cursor)

    # Main Highlighters 
fg_main='fg=#ff8feb'                                                        # magenta from starship.toml 
fg_warn='fg=#FF579D,bold'                                                   # yellow  
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
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffff80'                       # light orange
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
ZSH_HIGHLIGHT_PATTERNS+=('sudo' $fg_warn)
ZSH_HIGHLIGHT_PATTERNS+=('$' 'fg=#33ff33')

    # Cursor Highlighter
ZSH_HIGHLIGHT_STYLES[cursor]='fg=white,underline'

# EXPORTS 

# Spicetify
export PATH=$PATH:/home/aaron/.spicetify

# Python (Versions managed by pyenv)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

