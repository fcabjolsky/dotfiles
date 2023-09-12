# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
alias startwork="tmuxinator start work"
alias startpersonal="tmuxinator start personal"
alias resumework="tmux attach -t work"
alias awsdocker="docker run --rm -it -v ./.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli"
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey -s ^f "tmux-sessionizer\n"
export PATH=$PATH:$(go env GOPATH)/bin
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/frontm/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/frontm/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/frontm/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/frontm/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

