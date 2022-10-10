export ZSH="/Users/liyi/.oh-my-zsh"
ZSH_THEME=""powerlevel10k/powerlevel10k
source $ZSH/oh-my-zsh.sh

plugins=(git docker docker-compose)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias git='LANG=en_GB git'
alias vi='lvim'
alias dc='docker-compose'
alias k='kubectl'
export EDITOR='nvim'
alias helm='/opt/homebrew/bin/helm'
alias note='cd ~/Library/Mobile\ Documents/27N4MQEA55~pro~writer/Documents && vi'
alias defx='cd ~/.config/nvim/vim-plug/ && vi defx-setting.vim'

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

export PATH="$PATH:/Users/liyi/google-cloud-sdk/bin:/Users/liyi/.nvm/versions/node/v16.14.0/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm



export TERM=xterm-256color
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/liyi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/liyi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/liyi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/liyi/google-cloud-sdk/completion.zsh.inc'; fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/liyi/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/liyi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/liyi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/liyi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"

alias ide='tmux split-window -v -p 30 && tmux split-window -h -p 66 && tmux split-window -h -p 50'
