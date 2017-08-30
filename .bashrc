source ~/.shellrc
source ~/.coast_shellrc
# Source bash completion if available.
[ -r /etc/bash_completion ] && . /etc/bash_completion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

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

alias s='. ~/.bashrc'

if [[ $UID -eq 0 ]]; then
    export PS1="${bred}\u@\h ${bblue}\w${reset}\n# "
else
    export PS1="${bgreen}\u@\h ${bblue}\w${reset}\n$ "
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
