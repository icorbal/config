# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0

#MAVEN
alias 'mci=mvn clean install'
alias 'mcist=mvn clean install -Dmaven.test.skip=true'
alias 'mdep=mvn dependency:tree | vim -'

#SVN
alias 'svn-add-unversioned=svn st | grep "^\?" | awk "{print \$2}" | xargs svn add $1'
export SVN_EDITOR=vim

#GIT
alias 'gdiff=git diff'
alias 'gpom=git push origin master'

#SERVERS
alias watch-jb-css-cds-log='tail -f \\\\css-cds\\c$\\jboss-eap-6.1\\standalone\\log\\server.log'
alias watch-jb-css-cds-3-log='tail -f \\\\css-cds-3\\d$\\bin\\jboss\\standalone\\log\\server.log'
alias watch-jb-css-cds-5-log='tail -f \\\\css-cds-5\\c$\\jboss-eap-6.1\\standalone\\log\\server.log'
alias watch-jb-cds-labs-log='tail -f \\\\cds-labs\\bin\\jboss-eap-6.2\\standalone\\log\\server.log'

#PI
alias pi='ssh pi@pi'

export LS_OPTIONS='--color=yes'
alias less="less -R"
alias ls='ls $LS_OPTION -h --color'
alias ll='ls $LS_OPTION -lh --color'
alias l='ls $LS_OPTIONS -Ff --color'
alias ld='ls -d $LS_OPTIONS -af --color'  # directories only!
alias pgrep='pgrep -lf'

#  -h makes the numbers human
alias df='df -h'
alias du='du -h -c'
alias ps='ps'
alias mkdir='mkdir -p'
alias grep='grep --colour'

# default bash_history is 500
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups
shopt -s histappend

#enable bash completion
[ -f /etc/bash-completion ] && source /etc/bash-completion


function lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37;1m[exited \033[31;1m'
    echo -n $code
    echo -n $'\033[37;1m] '
  fi
}

function activevirtualenv() {
  if [ -n "$VIRTUAL_ENV" ]; then
      echo -n "("
      echo -n $(basename $VIRTUAL_ENV)
      echo -n ") "
  fi
}

export INPUTRC=~/.inputrc
export PROMPT_COMMAND='echo -n -e "\033k\033\0134"'

alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative" 

# taken from http://plasti.cx/2009/10/23/vebose-git-dirty-prompt
# origin of work http://henrik.nyh.se/2008/12/git-dirty-prompt
function parse_git_dirty {
status=$(git status 2> /dev/null)
  dirty=`    echo -n "${status}" 2> /dev/null | grep -q "Changed but not updated" 2> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep -q "Untracked files" 2> /dev/null; echo "$?"`
  ahead=`    echo -n "${status}" 2> /dev/null | grep -q "Your branch is ahead of" 2> /dev/null; echo "$?"`
  newfile=`  echo -n "${status}" 2> /dev/null | grep -q "new file:" 2> /dev/null; echo "$?"`
  renamed=`  echo -n "${status}" 2> /dev/null | grep -q "renamed:" 2> /dev/null; echo "$?"`
  bits=''
  if [ "${dirty}" == "0" ]; then
    bits="${bits}*"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="${bits}?"
  fi
  #if [ "${newfile}" == "0" ]; then
  #  bits="${bits}*"
  #fi
  if [ "${ahead}" == "0" ]; then
    bits="${bits}+"
  fi
  if [ "${renamed}" == "0" ]; then
    bits="${bits}>"
  fi
  echo "${bits}"
}

function parse_git_branch {
    ref=$(git branch 2>/dev/null|grep \*|sed 's/* //') || return
    if [ "$ref" != "" ]
    then
        echo "("${ref}") "
    fi
}

DEFAULT_COLOR="[33;0m"
GRAY_COLOR="[37;1m"
PINK_COLOR="[35;1m"
GREEN_COLOR="[32;1m"
CYAN_COLOR="[36;1m"
RED_COLOR="[31;1m"
ORANGE_COLOR="[33;1m"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GRAY="\[\033[0;37m\]"
GREEN="\[\033[0;32m\]"
LIGHT_PURPLE="\[\033[1;34m\]"
WHITE="\[\033[1;20m\]"
CYAN="\[\033[1;35m\]"
export PS1="$WHITE\h|$GREEN\u $YELLOW\$(parse_git_branch)$GRAY_COLOR/\W:\[\033[0m\] "

BASEPROMPT="$WHITE\$(lastcommandfailed)[\A] \h|\[\e${GREEN}\]\u\[\e${ORANGE_COLOR}\] \$(activevirtualenv)\[\e${GRAY_COLOR}\]\$(parse_git_branch)\[\e${GREEN_COLOR}\]\w\[\e${DEFAULT_COLOR}\]"
PROMPT="${BASEPROMPT}\n\[\e${GRAY_COLOR}\]$ \[\e${DEFAULT_COLOR}\]"
export PS1=$PROMPT
