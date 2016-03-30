
alias sshw='ssh wall.xobni.yahoo.com'
alias sshadd='ssh-add ~/.ssh/id_rsa'
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -l'

alias cdy='cd /home/y'
alias cdl='cd /home/y/logs'
alias cds='cd /home/y/logs/smartr_contacts_social_proxy'
alias cdv='cd /home/y/var/cassandra'
alias cdx='cd /home/y/lib/smartr-backend'
alias dbl='tail -f /home/y/logs/cassandra/system.log'
alias iftop='/var/tmp/iftop -N'
alias ios='iostat -x -m 1'
alias htop='/var/tmp/htop'

alias ndc='nodetool -h 127.0.0.1 -p 7199 compactionstats'
alias ndf='nodetool -h 127.0.0.1 -p 7199 cfstats'
alias ndi='nodetool -h 127.0.0.1 -p 7199 info'
alias ndr='nodetool -h 127.0.0.1 -p 7199 ring'
alias nds='nodetool -h 127.0.0.1 -p 7199 status'
alias ndt='nodetool -h 127.0.0.1 -p 7199 tpstats'

alias wea='tail -f /home/y/logs/smartr_contacts_backend_web/access-logs.log'
alias wel='tail -f /home/y/logs/smartr_contacts_backend_web/web-debug.log'
alias wol='tail -f /home/y/logs/smartr_contacts_backend_worker/worker-debug.log'
alias xml='tail -f /home/y/logs/smartr_contacts_mail_proxy/debug.log'

alias woj='curl -s http://127.0.0.1:9001 | grep job'
alias wos='curl -s http://127.0.0.1:9001/status'
alias wot='curl -s http://127.0.0.1:9001/status/dispatcher'

alias xdcv='yinst ls | grep -e yapache_cassandra -e smartr_contacts -e ymono -e yjava_jdk'


h() {
  local COUNT=${COUNT:-25}

  if [ -z "$@" ]; then
    history $COUNT
  else
    history | ack "$@" | tail -n $COUNT
  fi
}

# -F : don't page if less than one screen
# -i : ignore-case
# -R : raw-control-char
# -S : chop-long-lines
# -c : clear-screen (rather than scroll to clear)
# -w : hilite-unread
# -X : no-init (won't clear screen on exit)
alias less='less -FiRSwX -c '

alias grep='grep --color=auto'

alias reload="source $HOME/.bashrc"

alias man=vman

vman() {
  \man "$@" | col -b | view - -c "set ft=man nomod"
}

#-------------------------------------------------

du_sort() {
  du -b --max-depth=1 $1 | sort -n | thousands
}

size_sort() {
  find ${1:-.} -type f -printf "%s %p\n" | sort -n | thousands
}

#-------------------------------------------------

alias apg='apg -a 1 -n 20 -m 20 -M SNCL -s'

rm_caches() {
  ack -ag '\.cache_' --print0 | xargs -0 rm -v 2>/dev/null
}

serve() {
  python -m SimpleHTTPServer ${1:-8000}
}

#-------------------------------------------------

dlu() {
  pick_with_vim "look $1" "dict"
}

#-------------------------------------------------

tad() {
  local ts=$(date +%s)
  local d="$HOME/.throw_away/$ts"
  mkdir -p $d
  (cd $d; bash)
  rm -r $d
}

alias af="ack_find"
