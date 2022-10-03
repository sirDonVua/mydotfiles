#       _               _
#      | |__   __ _ ___| |__  _ __ ___
#      | '_ \ / _` / __| '_ \| '__/ __|
#     _| |_) | (_| \__ \ | | | | | (__
#    (_)_.__/ \__,_|___/_| |_|_|  \___|


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# => checks for neded packages

# => History variables 
HISTCONTROL=ignoreboth #no duplicante and commands start with spaces
HISTSIZE=1000          #history size
HISTFILESIZE=2000      #~/.bash_history file size



# => shopt
shopt -s checkwinsize  #change rows and coulmns sizes after each command if needed
shopt -s histappend    #append do not overwrite 
shopt -s cmdhist       #multiline commans saved as 1 line in history
#shopt -s globstar
shopt -s autocd        #change dir witout cd command
shopt -s cdspell       #spellcheck for cd command
shopt -s dotglob       #*.* will include hidden files

# => tab completion
. /usr/share/bash-completion/bash_completion || \
    . /etc/bash_completion
#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
## END ##


### EXPORT ###
export TERM="xterm-256color"     # getting proper colors
export EDITOR="vim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
## END ##


### ALIASES ###
#package mnagers
alias apt='sudo nala'
alias aptup='sudo nala upgrade'
alias deb='deb-get'
alias nix='nix-env'

#lsd as ls
alias ls='lsd'
alias ll='lsd -alF'
alias la='lsd -A'
alias lt='lsd --tree'

#bat as cat & mkdir parent and childs
alias cat='bat'
alias mkdir='mkdir -pv'

#files and dir
alias cp='cp -r'
alias rm='rm -r'

#config files
alias bashrc='$EDITOR $HOME/.bashrc && . $HOME/.bashrc'
alias fishrc='$EDITOR $HOME/.config/fish/config.fish'
## END ##


### NIX ###
if [ -d $HOME/.nix-profile  ] ;then
    . ~/.nix-profile/etc/profile.d/nix.sh
	export XDG_DATA_DIRS=~/.local/share/:~/.nix-profile/share:/usr/share
	if [ -d $HOME/.nix-profile/share/applications/ ] ;then
        cp -f ~/.nix-profile/share/applications/*.desktop ~/.local/share/applications/
    fi
fi
## END ##

### FANCY STUFF ###
eval "$(starship init bash)" #starship prompt
figlet bash | lolcat
