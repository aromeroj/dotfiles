# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors
autoload -U colors && colors

if [[ ! -f ~/.p10k.zsh ]]; then
  # Change prompt:
  PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
fi

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

if type exa > /dev/null; then
  alias ls='exa'
  alias ll='exa -l -g --icons'
  alias la='exa -la -g --icons'
  alias lt='exa -l -g --icons -s modified'
else
  alias ls='ls --color=auto'
  alias ll='ls -l --color=auto'
  alias la='ls -la --color=auto'
  alias lt='ls -ltr --color=auto'
fi

if type nvim > /dev/null; then
  alias vim='nvim'
fi

if type fzf > /dev/null; then
    eval "$(fzf --zsh)"
fi

export PATH="/usr/local/sbin:$PATH"

if [[ -f $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
fi

if [[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set maximum number of open file descriptors to 4096
ulimit -n 4096

# Load zsh-syntax-highlighting; should be last.
if [[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
