#
# ~/.zshrc
#


# path
typeset -U path
path=(~/bin ~/.local/bin $(ruby -rubygems -e "puts Gem.user_dir")/bin $path)

# default programs
export EDITOR=vim
export BROWSER=chromium

# default less options
export LESS='-R -i'

# colored man pages
export LESS_TERMCAP_md=$'\E[34m'        # section headers, etc - blue
export LESS_TERMCAP_us=$'\E[36m'        # emphasized words - cyan
export LESS_TERMCAP_so=$'\E[01;30;43m'  # highlight, e.g. from searching - base color on yellow
export LESS_TERMCAP_mb=$'\E[31m'        # ??
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'         # reset
export LESS_TERMCAP_se=$'\E[0m'

# ls colors
eval `dircolors ~/.dircolors`

# disable flow control
stty stop undef

# disable beep
#setterm -blength 0

# zsh options
setopt nobeep
setopt autocd
setopt dvorak
setopt correct
setopt automenu
setopt autolist
setopt glob
setopt extendedglob
setopt noautoremoveslash
setopt noalwaystoend
setopt autoparamslash
setopt completeinword
setopt noflowcontrol
unsetopt cdablevars

# print timing info for commands that run for longer than this number of seconds
REPORTTIME=7

# history
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000

# zle modules
autoload -U zcalc zargs zmv

# completion
zmodload zsh/complist
autoload -U compinit
compinit
zstyle :compinstall filename "${HOME}/.zshrc"

#zstyle ':completion:*' force-list always
#zstyle ':completion:*' menu yes select

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache

zstyle ':completion:*' completer _complete _match _approximate   # approximate matching
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#zstyle ':completion:*:*:vim:*' file-patterns '*.(sh|zsh|py|tex|lua|conf|service):text-files' '%p:all-files'
#zstyle ':completion:*:*:gvim:*' file-patterns '*.(sh|zsh|py|tex|lua|conf|service):text-files' '%p:all-files'

#zstyle ':completion:*:*:kill:*' menu yes select   # completion for kill PIDS
#zstyle ':completion:*:kill:*'   force-list always

#zstyle ':completion:*:*:killall:*' menu yes select   # and killall process names
#zstyle ':completion:*:killall:*'   force-list always
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd | tail -n +2'

zstyle ':completion:*:cd:*' ignore-parents parent pwd   # ignore parent dir for cd completion


#
# prompt
#

autoload -U colors && colors
setopt prompt_subst

#
# left main prompt
#

# set color of username: root or normal user
if [[ $UID == 0 ]]; then
  user_color=$fg[red]
else
  user_color=$fg[blue]
fi

# set color of hostname: local or ssh
if [[ -n "$SSH_CLIENT" ]]; then
  host_color=$fg[yellow]
else
  host_color=$fg[blue]
fi

# other colors
sep_color=$reset_color
path_color=$fg[blue]
ret_color=$fg[red]
accent_color=$fg[green]

PROMPT="%{$user_color%}%n%{$sep_color%}@%{$host_color%}%m%{$sep_color%}:%{$path_color%}%~ %(?..%{$ret_color%}%? )%{$accent_color%}> %{$reset_color%}"


#
# right git prompt
#

# color and symbol settings
GIT_PROMPT_AHEAD="%{$fg[red]%}+"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}-"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎"
GIT_SYMBOL="▪"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}$GIT_SYMBOL"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}$GIT_SYMBOL"
GIT_PROMPT_STAGED="%{$fg[green]%}$GIT_SYMBOL"
GIT_PROMPT_EMPTY="%{$fg[blue]%}$GIT_SYMBOL"


# find git branch/tag, or name-rev if on detached head
_git_branch () {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# show different symbols as appropriate for various git states
_git_state () {
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  [ "$NUM_AHEAD" -gt 0 ] && GIT_STATE=$GIT_STATE$GIT_PROMPT_AHEAD$NUM_AHEAD

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  [ "$NUM_BEHIND" -gt 0 ] && GIT_STATE=$GIT_STATE$GIT_PROMPT_BEHIND$NUM_BEHIND

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD && GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING

  [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]] && GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED

  git diff --quiet 2> /dev/null || GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED

  git diff --cached --quiet 2> /dev/null || GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED

  [[ -n $GIT_STATE ]] || GIT_STATE=$GIT_PROMPT_EMPTY

  echo "$GIT_STATE"
}

# make prompt if inside a git repository
_git_prompt () {
  local git_where="$(_git_branch)"
  [ -n "$git_where" ] && echo "%{$path_color%}${git_where#(refs/heads/|tags/)}%{$sep_color%}:$(_git_state)%{$reset_color%}"
}

RPROMPT='$(_git_prompt)'


# screen hardstatus title
#if [[ "$TERM" == "screen-256color" || "$TERM" == "screen" ]]; then
#  preexec () {
#    if [[ $PWD == $HOME ]]; then
#      dir="~"
#    else
#      dir=${PWD##*/}
#    fi
#    echo -ne "\ek${dir}:${1%% *}\e\\"
#  }
#fi




#
# keyboard
#

# vi mode
bindkey -v

# insert mode keys
bindkey -M viins "$terminfo[kcuu1]" history-beginning-search-backward
bindkey -M viins "$terminfo[kcud1]" history-beginning-search-forward
bindkey -M viins "$terminfo[kbs]" vi-backward-delete-char
bindkey -M viins "$terminfo[khome]" vi-beginning-of-line
bindkey -M viins "$terminfo[kend]" vi-end-of-line
bindkey -M viins "$terminfo[kdch1]" vi-delete-char

# dvorak shortcuts
bindkey -M viins '^N' history-search-backward
bindkey -M viins '^T' history-search-forward
bindkey -M viins '^S' vi-forward-char
bindkey -M viins '^H' vi-backward-char

# dvorak cmd mode
bindkey -rM vicmd 'j'
bindkey -rM vicmd 'k'
bindkey -rM vicmd 's'
bindkey -M vicmd 's' vi-forward-char
bindkey -M vicmd 'n' history-search-backward
bindkey -M vicmd 't' history-search-forward
bindkey -sM vicmd 'k' 't'
bindkey -sM vicmd 'l' vi-repeat-search
bindkey -sM vicmd '\-' '\$'
bindkey -sM vicmd '_' '\^'



#
# aliases
#

# customized commands
alias ls="ls -ph --color=always --group-directories-first"
alias top="top -d 1 -H"
alias ps="ps -e"
alias grep="grep --color=always -i"
alias locate="locate -i"
alias df="df -h"
alias di="di -I ext4 -f SMbuvpt -H -t"
alias killall="killall -v"
alias pgrep="pgrep -a"

# pipes
alias -g ll="| less"
alias -g gg="| grep"
alias -g nn="| wc -l"
alias -g hh="| head"
alias -g tt="| tail"
alias -g ss="| cut -c 1-150"
alias -g cols="| column -t"

# files
alias -g zrc="~/.zshrc"
alias -g vrc="~/.vimrc"
alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."

# file management
alias ls1="ls -1"
alias lsa1="ls -a1"
alias lsl="ls -l"
alias lsa="ls -a"
alias lsla="ls -la"
alias lslt="ls -lt"
alias lst="ls -t"
alias -g cpv="cp -v"
alias -g cpr="cp -r"
alias -g cprv="cp -rv"
alias -g cpa="cp -a"
alias -g cpav="cp -av"
alias -g mvv="mv -v"
alias -g rmr="rm -rf"
alias rcp="rsync -avhP"
alias rcpd="rsync -avhP --delete-after"

# sysadmin
alias -g p="pacman"
alias -g pa="packer"
alias syu="packer -Syu"
alias sc="systemctl"
alias sd="systemctl poweroff"
alias rb="systemctl reboot"
alias sp="systemctl suspend"
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias restart="sudo systemctl restart"
alias jc="journalctl"
alias updatemirrorlist="sudo reflector --country 'United States' --protocol http --age 12 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias updategrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# single letter commands
alias c='clear'
alias g="git"
alias q="exit"
alias s="screen"

# etc
alias sx="startx"
alias cdc='cd && clear'
alias cleantmp="rm -rfv $HOME/tmp/*"
alias rld="source ~/.zshrc"
alias k1="killall -1"
alias k9="killall -9"
alias soff="sleep 0.1 && xset dpms force off"
alias son="xset -dpms"
alias exf="exfalso . &> /dev/null &"
alias gv="gwenview . &> /dev/null &"
alias konq="konqueror . &> /dev/null &"
alias proxy="ssh -Nfq proxy"
alias ethip="sudo dhcpcd -n eth0"
alias extip="curl -s http://ipecho.net/plain"
#alias nexdef="java -Xmx512m -jar $HOME/etc/mlbtv/nexdef.jar &> /dev/null &"
alias mlb="mlbviewer"
alias mounts="column -t /proc/mounts"
alias fehh="feh -FZY"
alias py="ipython"
alias pyqt="ipython qtconsole"
alias pynb="ipython notebook"
alias nose="nosetests3 --with-coverage"
alias g++11="g++ -std=c++11"
alias cpplint="cpplint --extensions=cxx,h --linelength=110"

function ok () { okular $@ &> /dev/null & }
function g_clone () { git clone git@github.com:jbernhard/$1.git $2 }


# local settings
# loaded last to enable overrides
[[ -r ~/.zshrc.local ]] && source ~/.zshrc.local || true
