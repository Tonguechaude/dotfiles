# My dotfiles Repo

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

    sudo apt install git

### GNU Stow

    sudo apt install stow

### Exemple with stow

```bash
stow btop dunst fastfetch fuzzel gitui hypr kitty nvim tmux waybar zed
```

### Node

    # Download and install nvm:
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    # in lieu of restarting the shell
    \. "$HOME/.nvm/nvm.sh"

    # Download and install Node.js:
    nvm install 22

    # Verify the Node.js version:
    node -v # Should print "v22.15.0".
    nvm current # Should print "v22.15.0".

    # Verify npm version:
    npm -v # Should print "10.9.2".

### Extensions coc

#### General

    :CocInstall coc-snippets coc-explorer coc-pairs coc-highlight coc-json coc-tsserver

Why ?

* coc-snippets : snippets génériques pour tous langages.
* coc-explorer : explorer de fichiers façon NERDTree.
* coc-pairs : autocomplétion des paires de parenthèses, crochets, etc.
* coc-highlight : highlight contextuel (symboles identiques).
* coc-json : completions et validation pour les fichiers .json.
* coc-tsserver : pour JS/TS (utilisé aussi par HTML/CSS).

#### Rust

    :CocInstall coc-rust-analyzer

#### Java

    :CocInstall coc-java

#### Python

    :CocInstall coc-pyright

#### PHP

    :CocInstall coc-phpls

Basé sur le PHP Language Server (nécessite composer global require felixfbecker/language-server).

#### HTML / CSS / JS / Markdown

    :CocInstall coc-html coc-css coc-markdownlint

coc-html : HTML intellisense (intègre Emmet).

coc-css : pour CSS/SCSS/Less.

coc-markdownlint : lint de Markdown, très utile pour rédactions pro/docs.

#### (Optionnel) Améliorations UX

    :CocInstall coc-diagnostic coc-fzf

coc-diagnostic : diagnostics détaillés via une interface lisible.

coc-fzf : intégration FZF pour les actions (require FZF).
