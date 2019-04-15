# Ensure home directory name is correct
export USER=$(whoami)
export ZSH="/Users/$USER/.oh-my-zsh"
plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_label dir vcs newline
  # icons_test newline
  context virtualenv status
)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Set colors
# To see all the colors, run: for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
# POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_DIR_FOREGROUND='white'
POWERLEVEL9K_DIR_BACKGROUND='009' # dark-grey
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='007' # light-grey

# POWERLEVEL9K_VCS_BACKGROUND="10" # light/pastel green
POWERLEVEL9K_VCS_FOREGROUND='white'

# Customize the git icons/emojis
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'⚠️ '
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'🙅🏻‍♂️'
POWERLEVEL9K_VCS_STAGED_ICON=$'🚀'

# Add a custom label icon prompt segment
POWERLEVEL9K_CUSTOM_LABEL="echo -n 💻 laptop"
POWERLEVEL9K_CUSTOM_LABEL_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_LABEL_BACKGROUND="017" # also like darkblue

# Context
POWERLEVEL9K_CONTEXT_BACKGROUND="white" # not working

# VirtualEnv
POWERLEVEL9K_VIRTUALENV_BACKGROUND="white"

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'

# Source/turn on Powerlevel9k
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

# Misc
HISTFILESIZE=100000
HISTSIZE=10000

### Source other bash files with specific/private setups
if [ -f ~/.affirm_specifics ] ; then source ~/.affirm_specifics; fi
alias affirmcfg="atom ~/.affirm_specifics"

### Aliases
alias bp="atom ~/code/dotfiles/bash_profile"
alias bpi="atom ~/code/dotfiles/bash_includes"
alias sourcebp="source ~/.bash_profile"

alias zshconfig="atom ~/code/dotfiles/zshrc"
alias sourcezsh="source ~/.zshrc"

alias dot="cd ~/code/dotfiles"

### Docker aliases
alias dk='docker-compose'
alias dlogs='docker-compose logs -f --tail=50'
alias cslogs='docker-sync logs -f'

### Git
alias lsl='ls -G -lh --color=auto'
function lsp() { ls -lh $1 | egrep -v '.*.pyc$'; }
alias grep='grep -i --color=auto'
alias gg='git grep -n --color --heading --break'
alias .b='source ~/.bashrc && source ~/.bash_profile'
alias gd='git diff'
alias gr='git rebase origin/master'
alias gu='git add . && git ci --amend --no-edit'

# gsr = Git Search Replace
function gsr() {
    search_string=$1
    replace_string=$2
    if [ -z $search_string ] || [ -z $replace_string ]
    then
        echo "-- Git Search & Replace (gsr)"
        echo "-- usage: gsr search_string replace_string"
    else
        git grep -l $search_string | xargs sed -i '' "s/$search_string/$replace_string/g"
        echo "Crushed it."
    fi
}

### git completion
fpath=(~/.zsh $fpath)

autoload -U compinit && compinit
zmodload -i zsh/complist

### aws completion
# source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh

### Imported from bash_profile

### TODO: Understand the below better

###
### Path-ey things
###
export PATH=$(pyenv root)/shims:/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:~/.ec2/bin
export PATH="$PATH:/Users/mikecohen/code/arcanist/bin/"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; else echo rbenv not installed; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; eval "$(pyenv virtualenv-init -)"; else echo pyenv not installed; fi

# generate ctags in different languages
# alias ctags_ruby='ctags -R --languages=ruby --exclude=.git --exclude=vendor/bundle --exclude=node_modules --exclude=coverage'
# alias ctags_python='ctags -R --languages=python --exclude=.git --exclude=node_modules --exclude=coverage'

# toggle show/hide hidden files in Finder
alias showhidefileson='defaults write com.apple.Finder AppleShowAllFiles YES; killall -HUP Finder'
alias showhidefilesoff='defaults write com.apple.Finder AppleShowAllFiles NO; killall -HUP Finder'

export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
