# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load auto-completions
autoload -Uz compinit && compinit

export PATH="$HOME/.cargo/bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.nvm/versions/node/v22.14.0/bin:$HOME/.local/share/zinit/polaris/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/puppet-editor-services:/opt/puppetlabs/bin"

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Ctrl + arrows
bindkey "\e[1;5D" backward-word          # Ctrl + Left
bindkey "\e[1;5C" forward-word           # Ctrl + Right
bindkey "\e[1;5A" up-line-or-history     # Ctrl + Up
bindkey "\e[1;5B" down-line-or-history   # Ctrl + Down

# Alt + arrows
bindkey "\e[1;3D" backward-word          # Alt + Left
bindkey "\e[1;3C" forward-word           # Alt + Right

# Suppr and Ctrl + Suppr
bindkey "^[[3~" delete-char              # Suppr
bindkey "^[[3;5~" kill-word              # Ctrl + Suppr

# Ctrl + Backspace
bindkey "^H" backward-kill-word

# Home / End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Ctrl + Home / End
bindkey "^[[1;5H" beginning-of-line
bindkey "^[[1;5F" end-of-line

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(rbenv init -)"

# install node js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
