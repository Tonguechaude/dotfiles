set nocompatible
filetype off

call plug#begin()

" Typescript syntax
Plug 'leafgarland/typescript-vim'
" jsx/tsx syntax
Plug 'peitalin/vim-jsx-typescript'

" Git Integration
Plug 'tpope/vim-fugitive'
" Fugitive Github plugin
Plug 'tpope/vim-rhubarb'

" Advanced Vim Targets (/!\ Will override some basic ones)
Plug 'wellle/targets.vim'

" Vim Session handling
Plug 'tpope/vim-obsession'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'

" .editorconfig support
Plug 'editorconfig/editorconfig-vim'

" Indent guide
Plug 'nathanaelkane/vim-indent-guides'

" Region Expansion
Plug 'terryma/vim-expand-region'

" Surrounding plugin (to add quotes/parens/brackets around stuff)
Plug 'tpope/vim-surround'

" Best status bar ever
Plug 'vim-airline/vim-airline'

" Conquer of Code (Completion and LSP support)
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Go
Plug 'fatih/vim-go'

" Ack support
" Beware ! git.fsck might not like this plugin. Use manual install if needed:
" git clone --config transfer.fsckobjects=false https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
Plug 'mileszs/ack.vim'

" Better substitution: use S instead of s and never look back !
Plug 'tpope/vim-abolish'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Code formatting
Plug 'sbdchd/neoformat'

" Javascript syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'othree/jsdoc-syntax.vim'

" PlantUML support
Plug 'aklt/plantuml-syntax'
let g:plantuml_set_makeprg = 0

" Vimdeck support (see https://github.com/tybenz/vimdeck)
Plug 'inkarkat/vim-SyntaxRange'
Plug 'inkarkat/vim-ingo-library'

" Better swap file handling
Plug 'gioele/vim-autoswap'

" Hashicorp Terraform syntax support
Plug 'hashivim/vim-terraform'

" Async library for Vim (not required on Vim8 but required on Neovim ?)
Plug 'Shougo/vimproc.vim'

" Easy HTML writing
Plug 'mattn/emmet-vim'

" Increment/Decrement in Visual Block mode
Plug 'vim-scripts/VisIncr'

" Undotree visualizer
Plug 'vim-scripts/undotree.vim'

" Best language tool checker
Plug 'rhysd/vim-grammarous'
" LanguageTool v6.x does not support --api anymore, breaking most LT-based
" plugins :(
let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
let g:grammarous#use_vim_spelllang = 1

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'sphamba/smear-cursor.nvim'

Plug 'ellisonleao/gruvbox.nvim'

" Linter
Plug 'dense-analysis/ale'

" Puppet
Plug 'rodjek/vim-puppet'

call plug#end()


lua require('smear_cursor').enabled = true

" CoC config
nmap <silent> gi <Plug>(coc-codeaction-cursor)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <silent> gn <Plug>(coc-rename)
" Conflicts with go-to-file-under-the-cursor
" nmap <silent> gf <Plug>(coc-refactor)

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" LEADER SHORTCUTS
let mapleader = " "
" Quit
noremap <LEADER>q :bw<CR>
" Select everything
nnoremap <LEADER>v V`]
" Clear search highlight
nnoremap <LEADER>, :noh<CR>
" Save current buffer
nnoremap <LEADER>w :w<CR>
" Alternate between two buffers
nnoremap <LEADER>a :b#<CR>
" The one, and only
nnoremap <LEADER>f :FZF<CR>

" NERDTree config
" Toggle NERDTree panel
nnoremap <LEADER>n :NERDTreeToggle<CR>
nnoremap <LEADER>N :execute 'cd %:h' <bar> NERDTree<CR>
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let g:NERDSpaceDelims = 1

" Désactiver l'intégration LSP d'ALE
let g:ale_disable_lsp = 1

" Activer les linters uniquement
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Activate FZF
set rtp+=~/.fzf

" Markdown support
" Treat *.md files as markdown syntax (default is modula2)
let g:markdown_fenced_languages = ['html', 'javascript', 'bash=sh']
" Remove wrapping for markdown (markdown interperters do it automatically for
" display anyway
autocmd FileType markdown setlocal tw=0

au BufNewFile,BufFilePre,BufRead *.dockerfile set filetype=dockerfile
au BufNewFile,BufFilePre,BufRead *.bashrc set filetype=sh
au BufNewFile,BufFilePre,BufRead *.env.local set filetype=sh

" Default formatting = vim native indentation
autocmd FileType * nmap <buffer> <LEADER>b ggVG=<CR>

" Don't forget to install prettier globally (npm install -g prettier)
autocmd FileType javascript nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType javascript setlocal formatprg=prettier\ --parser\ typescript\ --stdin-filepath\ @%

autocmd FileType json nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType json setlocal formatprg=prettier\ --parser\ json\ --stdin-filepath\ @%n

autocmd FileType typescript* nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType typescript* setlocal formatprg=prettier\ --stdin-filepath\ @%

autocmd FileType html nmap <buffer> <LEADER>b :Neoformat<CR>
" autocmd FileType html setlocal formatprg=npx\ html-beautify\ -A\ 'force-aligned'\ -n
autocmd FileType html setlocal formatprg=prettier\ --parser\ html\ --stdin-filepath\ @%

autocmd FileType svg nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType svg setlocal formatprg=prettier\ --parser\ html\ --stdin-filepath\ @%

autocmd FileType css nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType css setlocal formatprg=prettier\ --parser\ css\ --stdin-filepath\ @%

autocmd FileType scss nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType scss setlocal formatprg=prettier\ --parser\ css\ --stdin-filepath\ @%

autocmd FileType go nmap <buffer> <LEADER>b :GoFmt<CR>

autocmd FileType yaml,yml nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType yaml,yml setlocal formatprg=prettier\ --parser\ yaml\ --stdin-filepath\ @%

autocmd FileType terraform nmap <buffer> <LEADER>b :TerraformFmt<CR>

autocmd FileType rust nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType rust setlocal formatprg=rustfmt\ --edition\ 2021

autocmd FileType python nmap <buffer> <LEADER>b :Neoformat<CR>
autocmd FileType python setlocal formatprg=black\ @%


let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']

" Security concerns and useless anyway
set modelines=0

" Keep default register when pasting (send erased selection in black hole
" register)
vnoremap <LEADER>p "_dP

" Move around windows
nnoremap <LEADER>h <C-w>h
nnoremap <LEADER><Left> <C-w>h
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER><Down> <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER><Up> <C-w>k
nnoremap <LEADER>l <C-w>l
nnoremap <LEADER><Right> <C-w>l

" Tab movement
nnoremap <F2> :tabp<CR>
nnoremap <F3> :tabn<CR>

" Default selection to region expansion
"noremap <r> <Plug>(expand_region_expand)

" Indent setup
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab
let delimitMate_expand_cr = 1

" File search
set wildmenu
set wildmode=list:longest
set wildignore+=node_modules/*,bower_components/*

" Misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start

" Display line number relative to the current one
set number 

" Undo info available across vim instances
set undofile

" Always display status line
set laststatus=2
" Display only the beginning of a branch
function! CustomBranchName(name)
    return fnamemodify(a:name, ':t')[0:12]
endfunction
let g:airline#extensions#branch#format = 'CustomBranchName'

" Sane search
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Not sure these are meant for :s
" nnoremap <tab> %
" vnoremap <tab> %

" Long lines handling
set wrap
set textwidth=0
set formatoptions=qrn1
" set colorcolumn=85

" Colorscheme
set t_Co=256
set background=dark " or light if you want light mode
colorscheme gruvbox

" Display trailing spaces and other stuff
set listchars=tab:\ \ ,trail:~,extends:>,precedes:<,nbsp:⎵
set list

" Force learn ^^'
noremap <F1> <nop>
inoremap «» <ESC>
inoremap »« <ESC>

" Centralize all vim temp files in home folder
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
set writebackup
set backupcopy=yes
" Ensure title and titlestring variables are set to default for autoswap
set title titlestring=
" Activate autoswap tmux feature so that opening an already open file will
" automatically switch to the already opened vim instance in the relevant
" tmux window/panel
let g:autoswap_detect_tmux = 1

" YouCompleteMe Fix
let g:ycm_server_python_interpreter="/usr/bin/python3"
" Disable location list population by YCM (already done by syntastic)
let g:ycm_always_populate_location_list=0

let g:editorconfig_Beautifier = "~/.vim/.editorconfig"

" Automatically refresh buffer on external changes
" For the CursorHold see
" [here](https://superuser.com/a/1090762)
set autoread
au CursorHold * checktime

" Wait x milliseconds of inactivity to write the current buffer into a swap
" file, and to trigger CursorHold a event.
set updatetime=2000

" Default the unnamed (default) register to the '+' one which is the default
" X one. Other systems (Windows for sure) should not care if it's '+' or '*'
" anyway.
" But for this to work you might need vim-gtk or vim-gnome installed
" (see http://vim.wikia.com/wiki/Accessing_the_system_clipboard for more info)
" Windows WSL user should look into this link for cross-clipboard handling:
" https://github.com/Microsoft/WSL/issues/892#issuecomment-275873108
set clipboard^=unnamedplus
" Prevent clipboard clearing on exit or suspend (Ctrl-Z)
if executable("xsel")
  function! PreserveClipboard()
    call system("xsel -ib", getreg('+'))
  endfunction
  function! PreserveClipboadAndSuspend()
    call PreserveClipboard()
    suspend
  endfunction
  autocmd VimLeave * call PreserveClipboard()
  nnoremap <silent> <c-z> :call PreserveClipboadAndSuspend()<cr>
  vnoremap <silent> <c-z> :<c-u>call PreserveClipboadAndSuspend()<cr>
endif

" Easymotion configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions

" Hide all statusline (Useful for Vimdeck presentations)
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
		set shortmess+=F
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
		set shortmess-=F
    endif
endfunction

nnoremap <LEADER><S-h> :call ToggleHiddenAll()<CR>


" ripgrep support
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

" Nvim only: create a dynamic split to view RegEx in real time
set inccommand=nosplit

" Set make command to "git diff" to help with rebases having conflicts
set makeprg=git\ diff\ --name-only\ \\\|\ \sort\ -u
set efm+=%f

" Useful bindings for vimdiff git conflicts management
function! MergeKeepLeft()
	let lastsearch = @/
	let @/ = '<<<<<<<'
	execute "normal! ?\<cr>dd"

	let @/ = '|||||||'
	execute "normal! /\<cr>V"

	let @/ = '>>>>>>>'
	execute "normal! /\<cr>d"

	let @/ = lastsearch
endfunction

function! MergeKeepBoth()
	let lastsearch = @/
	let @/ = '<<<<<<<'
	execute "normal! ?\<cr>dd"

	let @/ = '|||||||'
	execute "normal! /\<cr>V"

	let @/ = '======='
	execute "normal! /\<cr>d"

	let @/ = '>>>>>>>'
	execute "normal! /\<cr>dd"

	let @/ = lastsearch
endfunction

function! MergeKeepRight()
	let lastsearch = @/
	let @/ = '<<<<<<<'
	execute "normal! ?\<cr>V"

	let @/ = '======='
	execute "normal! /\<cr>d"

	let @/ = '>>>>>>>'
	execute "normal! /\<cr>dd"

	let @/ = lastsearch
endfunction

if &diff
	nnoremap <LEADER>a :<C-U>call MergeKeepLeft()<CR>
	nnoremap <LEADER>u :<C-U>call MergeKeepBoth()<CR>
	nnoremap <LEADER>i :<C-U>call MergeKeepRight()<CR>
endif

" vim-emmet configuration
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" Explain Rust errors
autocmd FileType rust nnoremap <LEADER>e :call CocCommand('rust-analyzer.explainError')<CR>
iabbrev imgr img.r-stretch<TAB>,
