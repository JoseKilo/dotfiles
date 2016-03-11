alias v='source .venv/bin/activate'
alias w='cd ~/workspace/rbx_warehouse_manager/'
alias r='python manage.py runserver'
alias t='python manage.py test --settings=rbx.settings.test'
alias tt='python manage.py test --settings=rbx.settings.integration_tests --noinput'
alias s='python manage.py shell'
alias pyc='find . -iname "*.pyc" -delete'
alias f='cat .reports/flake8-report.txt; echo'
alias cleanbranch='git fetch origin -p; git checkout master; git reset --hard origin/master'
alias nvmactivate='. /home/jose/.nvm/nvm.sh'
alias cleanvms='for i in `vboxmanage list vms | cut -d "{" -f 2 | cut -d "}" -f 1`; do vboxmanage controlvm "$i" poweroff; vboxmanage unregistervm "$i" --delete; done && rm -Rf /home/jose/VirtualBox\ VMs/*'
alias is='isort -rc -s */*/migrations/*.py rbx tests'
alias clipboard='xclip -sel clip'
alias cscp='rsync --partial --progress --rsh=ssh'
alias shrug='echo "¯\_(ツ)_/¯"'

# nvmactivate
# nvm use v0.10.33 > /dev/null

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

export PS1="\[\e[0;36m\]\W\[\e[0m\]> "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function auto_activate() {
    if [ -d .venv  ]
    then
        . .venv/bin/activate
    elif [ $VIRTUAL_ENV ]
    then
        deactivate
    fi
}

function cd_and_auto_activate() {
    cd $*
    auto_activate
}
alias cd='cd_and_auto_activate'
auto_activate
