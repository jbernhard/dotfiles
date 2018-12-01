#
# ~/.zshrc
#

# path
typeset -U path
path=(~/bin ~/.local/bin $(ruby -e 'puts Gem.user_dir')/bin $(npm get prefix)/bin $path)

# function search path
typeset -U fpath
fpath=(~/.local/share/zsh/site-functions $fpath)

# default programs
export EDITOR=nvim
export BROWSER=chromium

# default parallel make
export MAKEFLAGS="-j$(nproc)"

# default less options
export LESS='-R -i'

# colored man pages
export LESS_TERMCAP_md=$'\E[34m'        # section headers, etc - blue
export LESS_TERMCAP_us=$'\E[36m'        # emphasized words - cyan
export LESS_TERMCAP_so=$'\E[07;33m'     # highlight, e.g. from searching - base color on yellow
export LESS_TERMCAP_me=$'\E[0m'         # reset
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'

# ls colors
eval $(dircolors ~/.dircolors)

# disable flow control
stty stop undef

# misc options
unsetopt beep
setopt auto_cd
setopt glob
setopt extended_glob
setopt correct
setopt dvorak

# useful modules
autoload -U zcalc zargs zmv

# print timing info for commands that run for longer than this number of seconds
REPORTTIME=10

# default command for a single input redirection
lessxf () { less -XF $@ }
READNULLCMD=lessxf

# enable termite opening new terminals in the current directory
[[ $TERM == xterm-termite ]] && source /etc/profile.d/vte.sh


# history

# oh-my-zsh settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history


# completion
zmodload zsh/complist
autoload -Uz compinit

unsetopt menu_complete
unsetopt flow_control
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
# approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# some lines from oh-my-zsh
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

compinit


# prompt

autoload -U colors && colors
setopt prompt_subst

# left main prompt

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

# right git prompt

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


# keyboard

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


# aliases

# customized commands
alias ls="ls -ph --color=always --group-directories-first"
alias top="top -d 1 -H"
alias ps="ps -e"
alias grep="grep --color=auto"
alias locate="locate -i"
alias df="df -h"
alias di="di -I ext4,btrfs -f SMbuvpt -H -t"
alias killall="killall -v"
alias pgrep="pgrep -a"

# pipes
alias -g ll="| less"
alias -g gg="| grep"
alias -g nn="| wc -l"
alias -g hh="| head"
alias -g tt="| tail"

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
alias mmv="noglob zmv -W"
alias rcp="rsync -avhP"
alias rcpd="rsync -avhP --delete-after"

# sysadmin
alias -g p="pacman"
alias -g pa="pacaur"
alias syu="pacaur -Syu"
alias -g sc="systemctl"
alias sd="systemctl poweroff"
alias rb="systemctl reboot"
alias sp="systemctl suspend"
alias -g jc="journalctl"
alias update-mirrorlist="sudo reflector --country 'United States' --protocol http --age 12 --sort rate --verbose --save /etc/pacman.d/mirrorlist"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# single letter commands
alias c='clear'
alias -g v="nvim"
alias g="hub"
alias q="exit"

# etc
alias sx="startx"
alias cdc='cd && clear'
alias cleantmp="rm -rfv $HOME/tmp/*"
alias rld="source ~/.zshrc"
alias k1="killall -1"
alias k9="killall -9"
alias soff="sleep 0.1 && xset dpms force off"
alias son="xset -dpms"
alias extip="curl -s http://ipecho.net/plain"
alias mounts="column -t /proc/mounts"
alias fehh="feh -FZY"
alias py="python"
alias ipy="ipython"
alias nose="nosetests --verbose"
alias cmakerel="cmake -DCMAKE_BUILD_TYPE=Release"
alias cmakedeb="cmake -DCMAKE_BUILD_TYPE=Debug"
alias redshift-toggle="killall -SIGUSR1 redshift"

function ok () { okular $@ &> /dev/null & }


# plugins

source ~/.zplug/init.zsh
zplug "zplug/zplug"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug load
