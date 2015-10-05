export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8
export NVM_DIR=~/.nvm

source $(brew --prefix nvm)/nvm.sh
source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
#antigen-bundle arialdomartini/oh-my-git
#antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen-apply

#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#MAVEN
alias mci='mvn clean install'
alias mcist'=mvn clean install -DskipTests'
alias mdep='mvn dependency:tree | vim -'

#SVN
alias 'svn-add-unversioned=svn st | grep "^\?" | awk "{print \$2}" | xargs svn add $1'
export SVN_EDITOR=vim

#GIT
alias gdiff='git diff'
alias gitpub='git push -u origin `git name-rev HEAD 2> /dev/null | awk "{ print \\$2 }"`'
alias gitl='git log --pretty=compact --graph --color --first-parent @{upstream}...HEAD'
alias gitlm='git log --pretty=compact --graph --color --first-parent origin/master...HEAD'
function git_current_branch() {
    git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}
   
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'

#SERVERS
alias watch-jb-css-cds-log='tail -f \\\\css-cds\\c$\\jboss-eap-6.1\\standalone\\log\\server.log'
alias watch-jb-css-cds-3-log='tail -f \\\\css-cds-3\\d$\\bin\\jboss\\standalone\\log\\server.log'
alias watch-jb-css-cds-4-log='tail -f \\\\css-cds-4\\d$\\bin\\jboss-eap-6.1\\standalone\\log\\server.log'
alias watch-jb-css-cds-5-log='tail -f \\\\css-cds-5\\c$\\jboss-eap-6.1\\standalone\\log\\server.log'
alias watch-jb-cds-labs-log='tail -f \\\\cds-labs\\bin\\jboss-eap-6.2\\standalone\\log\\server.log'
alias watch-thinkehr-css-cds-4-log='tail -f \\\\css-cds-4\\d$\\bin\\thinkehr-es-server-1.6.7\\logs\\thinkehr-full.log'

#PI
alias pi='ssh pi@pi'

