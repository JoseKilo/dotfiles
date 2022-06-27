alias v='if [[ -f .venv/bin/activate ]]; then . .venv/bin/activate; elif [[ -f .tox/py36/bin/activate ]]; then . .tox/py36/bin/activate; fi'
alias r='python manage.py runserver'
alias t='python manage.py test'
alias s='python manage.py shell'
alias pendrive-out='sudo umount /dev/sda1'
alias pendrive='sudo mount /dev/sda1 /mnt/h'
alias movil-out='sudo fusermount -u /mnt/h2'
alias movil='sudo mtpfs -o allow_other /mnt/h2/'
alias pyc='find . -iname "*.pyc" -delete'
alias pycache='find . -iname "__pycache__" -exec rm -Rf {} \;'
alias f='./env/bin/flake8 --max-line-length=115 --exclude=doc,env,static,media,migrations,.ropeproject,*_trash */ && echo OK !'
alias cleanmaster='git fetch origin -p && git checkout master && git reset --hard origin/master'
alias cleanmain='git fetch origin -p && git checkout main && git reset --hard origin/main'
alias cleandevelop='git fetch origin -p && git checkout develop && git reset --hard origin/develop'
alias gf='git submodule foreach'
alias nvmactivate='. ~/.nvm/nvm.sh; nvm use default'
alias cleanvms='for i in `vboxmanage list vms | cut -d "{" -f 2 | cut -d "}" -f 1`; do vboxmanage controlvm "$i" poweroff; vboxmanage unregistervm "$i" --delete; done && rm -Rf /home/jose/VirtualBox\ VMs/*'
alias is='isort -rc -s */*/migrations/*.py rbx tests'
alias clipboard='xclip -sel clip'
alias cscp='rsync --partial --progress --rsh=ssh'
alias m='python manage.py makemessages -a --no-obsolete -i env'
alias mp='mpv -fs -af volume=8,scaletempo=speed=tempo'
alias shrug='echo "¯\_(ツ)_/¯"'
alias sizes='dpkg-query --show --showformat='"'"'${Package;-50}\t${Installed-Size} ${Status}\n'"'"' | sort -k 2 -n | grep -v deinstall'
alias latest='zgrep "install " /var/log/dpkg.log* | cut -d ":" -f 2- | sort'
alias vv='. ~/.venv/bin/activate'
alias vold='. $OLDPWD/.venv/bin/activate'
alias cc='cloc --exclude-dir=.tox .'
alias randmp="while true; do ls * | sort -R | tr '\n' '\0' | xargs -0 mpv --no-video --speed 1.0 -af scaletempo=speed=tempo; done"
alias redshift_london='redshift -l 51.509865:-0.118092'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias fixterm="printf '\e[?2004l'"  # printf '\e[?2004h'
alias mpr='mpv --no-video --loop --shuffle .'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gpgtty='gpg-connect-agent updatestartuptty /bye'
alias http-server='python -m http.server 4242'
alias md='pandoc -t plain'
alias k='gpgconf --kill gpg-agent && gpgtty'
alias shot="scrot '/tmp/%F_%T_$wx$h.png' -s -e 'xclip -selection clipboard -target image/png -i $f'"
alias play_ocean='play -n -n --combine merge synth pinknoise band -n 1200 1800 tremolo 50 10 tremolo 0.14 70 tremolo 0.2 50 gain  -10'
alias play_pinknoise='play -c 2 -n synth pinknoise band -n 2500 4000 tremolo 0.03 5 reverb 20 gain'
alias play_enterprise='play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20'
alias whats-app='firefox -P W https://web.whatsapp.com/'
alias ports='netstat -nputwc 2>&1 | grep '
alias u='unset HISTFILE'

setxkbmap -layout "gb,es"
setxkbmap -option caps:escape
stty -ixon  # Turn off Ctrl-s and Ctrl-q

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ne `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}
function stopwatch(){
  date1=`date +%s`;
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}

function cleanbranch() {
    git fetch origin -p
    git checkout ${1:-master}
    git reset --hard origin/${1:-master}
}

export PS1="\[\e[0;36m\]\W\[\e[0m\]> "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function auto_activate() {
    if [ -d .venv  ]
    then
        . .venv/bin/activate
    elif [ -d .tox  ]
    then
        . .tox/py36/bin/activate
    elif [ $VIRTUAL_ENV ]
    then
        deactivate
    fi
}

function cd_and_auto_activate() {
    cd "$@"
    auto_activate
}
alias cd='cd_and_auto_activate'
auto_activate

if [ -f ~/.local_bashrc ]; then
  . ~/.local_bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bind "set completion-ignore-case on"
bind "set completion-map-case on"  # Treat hyphens and underscores as equivalent
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

export NVM_DIR="/home/merlin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

PROMPT_COMMAND='history -a'
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"

export GOPATH=~/.go
export PATH=$PATH:~/workspace/golang/go-go1.12.6/bin/:~/.go/bin/

