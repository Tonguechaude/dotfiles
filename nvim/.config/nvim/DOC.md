# Neovim Config — Documentation

> **Leader** = `<Space>` | **LocalLeader** = `,`

---

## Plugins installés

### UI & Apparence
| Plugin | Rôle |
|---|---|
| **catppuccin** | Thème actif : Mocha (transparent) |
| **lualine** | Barre de statut |
| **bufferline** | Onglets de buffers en haut |
| **noice** | UI pour la cmdline, les messages LSP et les popups |
| **nvim-notify** | Notifications visuelles (timeout 1s, style minimal) |
| **alpha** | Dashboard au démarrage |
| **which-key** | Affiche les keybinds disponibles après avoir appuyé sur `<leader>` |
| **snacks** | Indent guides animés, accélération gros fichiers, navigation par mots |
| **illuminate** | Surligne toutes les occurrences du mot sous le curseur |
| **nvim-colorizer** | Colorise les codes couleur (#fff, rgb(...), etc.) directement dans le buffer |
| **mini.map** | Minimap du fichier (toggle `mt`) |
| **mini.diff** | Diff inline dans le gutter (toggle `<leader>gD`) |
| **web-devicons** | Icônes de fichiers (dépendance) |

### Navigation
| Plugin | Rôle |
|---|---|
| **flash** | Navigation rapide dans le buffer — `s` + quelques lettres pour sauter |
| **telescope** | Fuzzy finder (fichiers, grep, buffers, LSP, git...) |
| **project.nvim** | Gestion de projets, auto-cd au root git, intégré dans Telescope |
| **yazi** | File manager terminal intégré (`<leader>o`) |
| **grapple** | Bookmarks de fichiers par projet git (style harpoon) |
| **Navigator** | Naviguer entre les splits nvim et les panes tmux |
| **dropbar** | Breadcrumbs LSP dans la winbar |
| **mini.jump** | Jump amélioré sur `f`/`t` avec repeat |
| **mini.bracketed** | `]`/`[` pour naviguer entre les éléments (buffers, diagnostics, quickfix...) |

### Édition
| Plugin | Rôle |
|---|---|
| **nvim-surround** | Entourer du texte de quotes/parenthèses/tags |
| **nvim-autopairs** | Fermeture automatique des paires `() [] {} "" ''` |
| **Comment.nvim** | Commenter/décommenter (`gcc`, `gc` en visuel) |
| **mini.operators** | Exchange de texte (`gX`) et autres opérateurs |
| **nvim-ufo** | Folding amélioré basé sur treesitter + indent |
| **vim-sleuth** | Détecte et applique automatiquement le style d'indentation du fichier |
| **nvim-lastplace** | Restaure la position du curseur à la réouverture d'un fichier |
| **parinfer-rust** | Balance automatique des parenthèses pour Clojure/Lisp |
| **suda.vim** | Écrire un fichier en lecture seule avec `:SudaWrite` |

### LSP & Complétion
| Plugin | Rôle |
|---|---|
| **mason** | Gestionnaire d'installation des LSP servers |
| **nvim-lspconfig** | Configuration des LSP servers |
| **blink.cmp** | Autocomplétion (super-tab, ghost text, signature live) |
| **lspsaga** | UI améliorée pour LSP (code actions, peek definition, finder) |
| **lsp-lines** | Affiche les diagnostics en ligne sous le code (toggle `<leader>ll`) |
| **inc-rename** | Rename avec preview live dans la cmdline |
| **conform** | Formatters par filetype (prettier, black, stylua) avec format on save |
| **refactoring** | Extraire fonctions/variables via Telescope |
| **rustaceanvim** | Support Rust avancé (remplace rust-analyzer via mason) |
| **friendly-snippets** | Collection de snippets pour blink.cmp |

**LSP servers installés via Mason :**
`bashls` `clangd` `cmake` `cssls` `dockerls` `html` `jsonls` `lua_ls`
`marksman` `pyright` `ruff` `ts_ls` `typos_lsp` `yamlls` `zls` + `puppet` (manuel)

### Treesitter
| Plugin | Rôle |
|---|---|
| **nvim-treesitter** | Coloration syntaxique précise, indentation, folding |
| **treesitter-textobjects** | Text objects : `af` (function), `ac` (class), `aa` (argument)... |
| **nvim-ts-autotag** | Ferme et renomme automatiquement les tags HTML/JSX |
| **ts-context-commentstring** | Commentaires corrects dans les fichiers mixtes (JSX, Vue...) |

### Git
| Plugin | Rôle |
|---|---|
| **gitsigns** | Indicateurs de diff dans le gutter, hunk navigation |
| **vim-fugitive** | Interface git complète (`:G`, `:Gvdiffsplit`...) |
| **diffview** | Vue diff complète fichier par fichier |
| **octo** | Gestion des PRs et issues GitHub directement dans nvim |

### Diagnostics
| Plugin | Rôle |
|---|---|
| **trouble** | Liste de diagnostics, quickfix, références LSP dans un panneau dédié |
| **todo-comments** | Surligne et liste les TODO/FIXME/NOTE/HACK |

### Debug & Tests
| Plugin | Rôle |
|---|---|
| **nvim-dap** | Debugger (breakpoints, step, REPL) |
| **nvim-dap-ui** | Interface graphique pour le debugger |
| **nvim-dap-virtual-text** | Affiche les valeurs de variables inline pendant le debug |
| **neotest** | Runner de tests unifié |

### Session & Workflow
| Plugin | Rôle |
|---|---|
| **persistence** | Sauvegarde et restaure les sessions par dossier |
| **auto-save** | Sauvegarde automatique (sauf en insert mode et TelescopePrompt) |
| **undotree** | Visualise l'arbre d'historique des modifications |
| **toggleterm** | Terminal intégré (horizontal, avec winbar) |

### Markdown / Docs
| Plugin | Rôle |
|---|---|
| **render-markdown** | Rendu markdown inline dans le buffer (headers, bold, listes...) |
| **markdown-preview** | Preview dans le navigateur |
| **mkdnflow** | Navigation entre liens, listes, tableaux markdown |

### Divers
| Plugin | Rôle |
|---|---|
| **vimtex** | Support LaTeX complet |
| **image.nvim** | Affichage d'images dans le terminal (backend kitty) |
| **neoclip** | Gestionnaire de clipboard avec historique (via Telescope) |
| **grapple** | File bookmarks par projet git |
| **wakatime** | Tracking du temps de code |
| **presence** | Discord Rich Presence |

---

## Keybindings

### Global

| Touche | Mode | Action |
|---|---|---|
| `kj` | Insert | Escape |
| `<leader>y` | N/V | Copier dans le clipboard système |
| `<leader>Y` | N | Copier la ligne dans le clipboard système |
| `<leader>d` | N/V | Supprimer sans polluer le registre |
| `p` | Visual | Coller sans écraser le registre |
| `J` / `K` | Visual | Déplacer la sélection vers le bas/haut |
| `<C-d>` / `<C-u>` | N | Scroll en gardant le curseur centré |
| `<C-f>` / `<C-b>` | N | Scroll page en gardant le curseur centré |
| `n` / `N` | N | Recherche suivante/précédente centrée |
| `<space><space>` | N | Effacer le surlignage de recherche |
| `<C-r>` | Visual | Find & replace la sélection |
| `<leader>f` | Visual | Formater un tableau Markdown avec pandoc |

### Navigation — Splits & Buffers

| Touche | Action |
|---|---|
| `<leader>h/j/k/l` | Déplacer le focus (split nvim ou pane tmux) |
| `<S-l>` / `<S-h>` | Buffer suivant / précédent |
| `<leader>q` | Fermer le buffer actuel |
| `<leader>bb` | Basculer vers le buffer précédent |
| `<leader>br` | Fermer les buffers à droite |
| `<leader>bl` | Fermer les buffers à gauche |
| `<leader>bo` | Fermer tous les autres buffers |
| `<leader>bp` | Épingler/désépingler le buffer |
| `<leader>bP` | Fermer les buffers non épinglés |

### Navigation — Flash

| Touche | Mode | Action |
|---|---|---|
| `s` | N/X/O | Jump vers n'importe quel endroit du buffer |
| `<leader>S` | N/X/O | Jump basé sur les nœuds treesitter |
| `<leader>r` | O | Remote flash (opérateur à distance) |
| `<leader>R` | X/O | Treesitter search |
| `<C-s>` | Cmdline | Toggle flash dans la recherche |

### Navigation — Telescope

| Touche | Action |
|---|---|
| `<leader>ff` | Trouver des fichiers |
| `<leader>fg` | Grep dans le projet |
| `<leader>fb` | Liste des buffers ouverts |
| `<leader>fw` | Grep sur le mot sous le curseur |
| `<leader>fr` | Fichiers récents |
| `<leader>fh` | Pages d'aide |
| `<leader>fs` | Symboles LSP du fichier |
| `<leader>fj` | Jump list |
| `<leader>ft` | TODOs/FIXMEs/NOTEs |
| `<leader>fc` | Historique du clipboard (neoclip) |
| `<leader>fS` | Suggestions orthographiques |
| `<leader>fp` | Tous les pickers Telescope |
| `<leader>fp` | Projets (project.nvim) |
| `<leader>gs` | Git status |
| `<leader>gl` | Git commits |
| `<leader>gb` | Git branches |
| `<leader>gt` | Git stash |
| `<C-d>` (dans buffers) | Supprimer le buffer de la liste |

### Navigation — Yazi / Bookmarks

| Touche | Action |
|---|---|
| `<leader>o` | Ouvrir yazi (dossier parent du fichier) |
| `<leader>O` | Reprendre la dernière session yazi |
| `<leader><C-o>` | Ouvrir yazi dans le cwd de nvim |
| `<leader>m` | Grapple : toggle bookmark sur le fichier actuel |
| `<leader>M` | Grapple : ouvrir la liste des bookmarks |
| `<leader>n` / `<leader>p` | Grapple : fichier suivant / précédent |
| `<Leader>;` | Dropbar : picker de symboles dans la winbar |
| `[;` / `];` | Dropbar : aller au début / contexte suivant |

### Snacks — Navigation par références

| Touche | Action |
|---|---|
| `]]` | Référence suivante du mot sous le curseur |
| `[[` | Référence précédente du mot sous le curseur |

### LSP

| Touche | Action |
|---|---|
| `gd` | Aller à la définition |
| `gD` | Aller à la déclaration |
| `gi` | Aller à l'implémentation |
| `gt` | Aller au type |
| `gr` | Références (Telescope) |
| `gl` | Diagnostics (Telescope) |
| `ge` | Diagnostic flottant |
| `K` | Documentation hover |
| `<space>k` | Signature help |
| `<space>rn` | Renommer le symbole |
| `<space>ga` | Code action |
| `<space>f` | Formater le fichier (LSP) |
| `<leader>ca` | Code action (lspsaga) |
| `<leader>cr` | Rename avec preview live (inc-rename) |
| `<leader>cf` | Toggle autoformat (buffer) |
| `<leader>cF` | Toggle autoformat (global) |
| `<leader>cs` | Symboles du fichier (Trouble) |
| `<leader>cl` | Refs/defs LSP (Trouble) |
| `<leader>lf` | LSP finder (lspsaga) |
| `<leader>lp` | Preview définition (lspsaga) |
| `<leader>ls` | Signature help (lspsaga) |
| `<leader>lw` | Diagnostics workspace (lspsaga) |
| `<leader>ll` | Toggle lsp-lines (diagnostics sous le code) |
| `<leader>rr` | Refactoring picker (Telescope) |

### Diagnostics — Trouble

| Touche | Action |
|---|---|
| `<leader>xx` | Diagnostics workspace (Trouble) |
| `<leader>xX` | Diagnostics buffer (Trouble) |
| `<leader>xq` | TODOs dans Trouble |
| `<leader>xQ` | TODOs en Quickfix |
| `<leader>xL` | Location list (Trouble) |

### Git

| Touche | Action |
|---|---|
| `<leader>gg` | Git status dans le buffer |
| `<leader>gps` | Git push |
| `<leader>gpf` | Git force push |
| `<leader>gc` | Git commit signé |
| `<leader>gri` | Git rebase interactif |
| `<leader>gra` / `<leader>grc` | Abort / continue rebase |
| `<leader>gD` | Toggle diff inline (mini.diff) |
| `<leader>gd` | Gvdiffsplit |
| `]c` / `[c` | Hunk suivant / précédent |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hR` | Reset buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame de la ligne |
| `<leader>hd` / `<leader>hD` | Diff hunk / contre ~ |
| `<leader>tb` | Toggle blame en ligne |
| `<leader>td` | Toggle affichage des suppressions |
| `ih` | Text object : sélectionner le hunk (O/X) |

### Debug (DAP)

| Touche | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Breakpoint conditionnel |
| `<leader>dc` | Continuer |
| `<leader>dC` | Continuer jusqu'au curseur |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dO` | Step over |
| `<leader>dr` | Toggle REPL |
| `<leader>dt` | Terminer |
| `<leader>du` | Toggle UI DAP |
| `<leader>de` | Évaluer expression (N/V) |
| `<leader>dw` | Widget hover |

### Tests (Neotest)

| Touche | Action |
|---|---|
| `<leader>tt` | Run tests du fichier courant |
| `<leader>tT` | Run tous les tests du projet |
| `<leader>tr` | Run le test le plus proche |
| `<leader>td` | Debug le test le plus proche |
| `<leader>ts` | Toggle résumé des tests |
| `<leader>to` | Voir l'output du test |
| `<leader>tO` | Toggle panneau d'output |
| `<leader>tS` | Stopper les tests |

### Session

| Touche | Action |
|---|---|
| `<leader>ss` | Restaurer la session du dossier actuel |
| `<leader>sl` | Restaurer la dernière session |
| `<leader>sd` | Ne pas sauvegarder la session actuelle |
| `<leader>ba` | Toggle auto-save |

### Treesitter — Text Objects

| Touche | Action |
|---|---|
| `af` / `if` | Outer/inner fonction |
| `ac` / `ic` | Outer/inner classe |
| `aa` / `ia` | Outer/inner argument |
| `ai` / `ii` | Outer/inner conditionnel |
| `al` / `il` | Outer/inner boucle |
| `at` | Commentaire |
| `]m` / `[m` | Fonction suivante/précédente (début) |
| `]M` / `[M` | Fonction suivante/précédente (fin) |
| `]]` / `[[` | Classe suivante/précédente |
| `<leader>a` | Swap paramètre suivant |
| `<leader>A` | Swap paramètre précédent |

### UI Divers

| Touche | Action |
|---|---|
| `<A-i>` | Toggle terminal (toggleterm) |
| `<leader>u` | Toggle undotree |
| `mt` | Toggle minimap (mini.map) |
| `gcc` | Commenter la ligne (Comment.nvim) |
| `gc` | Commenter la sélection (Comment.nvim) |
| `gX` | Échanger deux blocs de texte (mini.operators) |
| `zR` | Ouvrir tous les folds |
| `zM` | Fermer tous les folds |
| `za` | Toggle le fold courant |

---

## Conflits connus / notes

- `<leader>d` est à la fois "supprimer sans registre" (global) et le préfixe debug. Neovim attend `timeoutlen` ms avant de décider — appuyer vite sur `db` déclenche le debug, attendre déclenche la suppression.
- `<leader>l` est Navigator droite ET le préfixe LSP (`<leader>lf`, `<leader>lp`...). Même comportement timeoutlen.
- `<leader>t` est le préfixe test (neotest). L'ancien raccourci terminal a été supprimé → utiliser `<A-i>` à la place.
