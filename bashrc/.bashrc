source ~/.shellrc
source ~/.coast_shellrc
# Source bash completion if available.
[ -r /etc/bash_completion ] && . /etc/bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r ~/.pass-tail.bash.completion ] && . ~/.pass-tail.bash.completion
[ -r ~/.lxc.bash.completion ] && . ~/.lxc.bash.completion

# Reset
reset='\e[0m'
# Regular Colors
black='\e[0;30m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
blue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
white='\e[0;37m'
# Bold
bblack='\e[1;30m'
bred='\e[1;31m'
bgreen='\e[1;32m'
byellow='\e[1;33m'
bblue='\e[1;34m'
bpurple='\e[1;35m'
bcyan='\e[1;36m'
bwhite='\e[1;37m'

# Print the colored escape sequences previously defined.
show_colors() {
    colors=(black red green yellow blue purple cyan white)
    for color in "${colors[@]}"; do
        bcolor="b"$color
        echo -en "${!color}"
        printf "%-8s " "${color}"
        echo -en "${!bcolor}"
        printf "%-8s\n" "b${color}"
    done
}

bits_to_human_readable() {
  numfmt --to=iec-i --suffix=B --padding=7 $1
}

#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

alias s='. ~/.bashrc'

if [[ $UID -eq 0 ]]; then
    export PS1="${bred}\u@\h ${bblue}\w${reset}\n# "
else
    export PS1="${bgreen}\u@\h ${bblue}\w${reset}\n$ "
fi
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# append and reload the history after each command
PROMPT_COMMAND="history -a; history -n"

# ignore certain commands from the history
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=10000000

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Base16 Shell
#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
