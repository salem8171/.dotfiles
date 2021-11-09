" Install plugins if missing
let plugged_path = has('nvim') ?
      \ stdpath('data') . '/site/autoload/plug.vim' :
      \ '~/.vim/autoload/plug.vim'
if empty(glob(plugged_path))
  let install_cmd = "!sh -c '" .
        \ 'curl --create-dirs -fLo ' . plugged_path . ' ' .
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
  execute install_cmd
  augroup pluginstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

"##############################################################################
" Plugins
"##############################################################################
let plugins_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plugins_dir)
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'mcmartelle/vim-monokai-bold'
Plug 'dense-analysis/ale'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'norcalli/nvim-colorizer.lua'
Plug '907th/vim-auto-save'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mboughaba/i3config.vim'
Plug 'VebbNix/lf-vim'
Plug 'junegunn/vim-peekaboo'
Plug 'skywind3000/asyncrun.vim'
Plug 'thinca/vim-quickrun'
Plug 'moll/vim-bbye'
Plug 'zhaocai/GoldenView.Vim'
" Plug 'yuki-ycino/fzf-preview.vim',
"       \ { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
" Plug 'vim-airline/vim-airline-themes'
" Plug 'dylanaraps/wal.vim'
" Plug 'thaerkh/vim-workspace'
" Plug 'ryanoasis/vim-devicons'
" Plug 'edkolev/tmuxline.vim'
" Plug 'dkprice/vim-easygrep'
" Plug 'OmniSharp/omnisharp-vim'

" coc extensions
if executable('node') && executable('npm') && executable('yarn')
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
  Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'iamcco/coc-post', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'bmatcuk/coc-stylelintplus', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'iamcco/coc-angular', {'do': 'npm install --no-package-lock'}
  " Plug 'fannheyward/coc-xml', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'yatli/coc-powershell', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'fannheyward/coc-marketplace', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'voldikss/coc-template', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'fannheyward/coc-sql', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'iamcco/coc-gitignore', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'voldikss/coc-github', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'josa42/coc-docker', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'yatli/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'jberglinds/coc-jira-complete', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'balta2ar/coc-jira', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'fannheyward/coc-terminal', {'do': 'npm install --no-package-lock'}
endif
call plug#end()

"##############################################################################
" General
"##############################################################################
set number relativenumber
augroup number
  autocmd!
  autocmd FileType vim-plug setlocal nonumber norelativenumber
augroup END

set signcolumn=yes
augroup signcolumn
  autocmd!
  autocmd FileType help,vim-plug setlocal signcolumn=no
augroup END

augroup cursorline
  autocmd!
  autocmd BufEnter * if &diff == 0 | setlocal cursorline | endif
  autocmd BufLeave * setlocal nocursorline
augroup END

set mouse=a
set confirm
set expandtab shiftwidth=2 autoindent smartindent
set noshowmode
set nowrap
set nohlsearch
set noswapfile
set foldmethod=syntax
set clipboard=unnamedplus
set colorcolumn=80
" set scrolloff=10
set sidescrolloff=10
" set pumblend=10
scriptencoding utf-8
if has('nvim') | set inccommand=split | else | set incsearch | endif
let mapleader = ' '
cnoreabbrev h vertical h
let &guicursor .= ',a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

command! -nargs=0 Vimrc :edit $MYVIMRC

inoremap <c-b> <left>
inoremap <c-f> <right>

inoremap <c-v> <c-r>+
vnoremap <c-c> "+y
vnoremap <c-v> "+p
vnoremap <c-x> "+d

nnoremap <c-z> u
inoremap <c-z> <esc>u
nnoremap <bs> X
vnoremap <bs> x
noremap <c-f> <esc>/
noremap <c-h> :%s/
vnoremap <c-h> :s/
noremap <silent> <c-a> <esc>ggVG
noremap <silent> <c-s> <esc>:w<cr>
inoremap <silent> <c-s> <esc>:w<cr>
noremap <silent> <c-n> <esc>:enew<cr>
" noremap <silent> <c-w> <esc>:bdelete<cr>
noremap <silent> <c-q> <esc>:qa<cr>
noremap <silent> <a-q> <esc>:q<cr>
noremap <silent> H <c-o>
noremap <silent> L <c-i>

"##############################################################################
" Terminal
"##############################################################################
if has('nvim')
  tnoremap <esc><esc><esc> <c-\><c-n>
  augroup terminal
    autocmd!
    autocmd BufEnter term://* startinsert
    autocmd TermOpen * startinsert
    autocmd TermOpen * setlocal nobuflisted foldcolumn=0
    autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
    " autocmd TermOpen,TermEnter * setlocal scrolloff=0
    " autocmd TermLeave * setlocal scrolloff=10
  augroup END
endif

"##############################################################################
" Window management
"##############################################################################
" Splits
set splitbelow splitright equalalways
noremap <A-/> <esc><c-w>v
noremap <A--> <esc><c-w>s
inoremap <A-/> <esc><c-w>v
inoremap <A--> <esc><c-w>s
tnoremap <A-/> <C-\><C-n><c-w>vi
tnoremap <A--> <C-\><C-n><c-w>si

" Movement
nnoremap <silent> <tab> :bn<cr>
nnoremap <silent> <s-tab> :bp<cr>
noremap <A-h> <esc><C-w>h
noremap <A-j> <esc><C-w>j
noremap <A-k> <esc><C-w>k
noremap <A-l> <esc><C-w>l
inoremap <A-h> <esc><C-w>h
inoremap <A-j> <esc><C-w>j
inoremap <A-k> <esc><C-w>k
inoremap <A-l> <esc><C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Resizing
noremap <silent> <AS-h> <esc>:vertical resize -1<cr>
noremap <silent> <AS-l> <esc>:vertical resize +1<cr>
noremap <silent> <AS-k> <esc>:resize -1<cr>
noremap <silent> <AS-j> <esc>:resize +1<cr>
inoremap <silent> <AS-h> <esc>:vertical resize -1<cr>
inoremap <silent> <AS-l> <esc>:vertical resize +1<cr>
inoremap <silent> <AS-k> <esc>:resize -1<cr>
inoremap <silent> <AS-j> <esc>:resize +1<cr>
tnoremap <silent> <AS-h> <c-\><c-n>:vertical resize -1<cr>i
tnoremap <silent> <AS-l> <c-\><c-n>:vertical resize +1<cr>i
tnoremap <silent> <AS-k> <c-\><c-n>:resize -1<cr>i
tnoremap <silent> <AS-j> <c-\><c-n>:resize +1<cr>i

"##############################################################################
" Colorscheme
"##############################################################################
" #272822 #23241e #1f201a #48483e #76715e #acada1
set termguicolors
silent colorscheme monokai-bold
highlight! Normal                     guibg=None
highlight! VertSplit    guifg=#1f201a guibg=None    ctermbg=None
highlight! CursorLine                 guibg=#2D2E27
highlight! CursorLineNr               guibg=None
highlight! Pmenu                      guibg=#1f201a
highlight! PmenuSel     guifg=#76715e guibg=#acada1
highlight! StatusLineNC guifg=#1f201a
highlight! StatusLine   guifg=#1f201a
highlight! LineNr                     guibg=None    ctermbg=None
highlight! SignColumn                 guibg=None    ctermbg=None
highlight! FoldColumn                 guibg=None    ctermbg=None
highlight! Error        guifg=#dc2566 guibg=None
highlight! diffRemoved  guifg=#dc2566
highlight! DiffAdd                    guibg=#8fc029
highlight! DiffDelete   guifg=pink    guibg=#dc2566
highlight! DiffText                   guibg=#55bcce
highlight! GitGutterAdd               guibg=None
highlight! GitGutterChange            guibg=None
highlight! GitGutterDelete            guibg=None
highlight! link Search Visual
highlight! link CocMenuSel CursorLine

let g:terminal_color_0 = '#48483e'
let g:terminal_color_1 = '#cb376b'
let g:terminal_color_2 = '#8fc029'
let g:terminal_color_3 = '#d4c96e'
let g:terminal_color_4 = '#4aa7b7'
let g:terminal_color_5 = '#9358fe'
let g:terminal_color_6 = '#56b7a5'
let g:terminal_color_7 = '#acada1'

let g:terminal_color_8 = '#48483e'
let g:terminal_color_9 = '#dc2566'
let g:terminal_color_10 = '#8fc029'
let g:terminal_color_11 = '#d4c96e'
let g:terminal_color_12 = '#55bcce'
let g:terminal_color_13 = '#9358fe'
let g:terminal_color_14 = '#56b7a5'
let g:terminal_color_15 = '#acada1'

"##############################################################################
" Airline
"##############################################################################
let g:airline_theme = 'monokaish'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_stl_path_style = 'short'

let g:airline_symbols = exists('g:airline_symbols') ? g:airline_symbols : {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.whitespace = 'Ξ'

"##############################################################################
" Autoformat
"##############################################################################
let g:autoformat_autoindent=0

augroup autoformat
  autocmd!
  " autocmd BufWritePre * :Autoformat
  autocmd FileType vim let b:autoformat_autoindent=1
  autocmd FileType desktop let b:autoformat_autoindent=1
augroup END

let g:formatdef_htmlbeautify =
      \'"html-beautify - -w ".&colorcolumn." -".(&expandtab ? "s ".shiftwidth() : "t")'
let g:formatdef_astyle_cs =
      \'"astyle --mode=cs --style=ansi --max-code-length=".&colorcolumn." --indent-namespaces -pcH".(&expandtab ? "s".shiftwidth() : "t")'

"##############################################################################
" Autosave
"##############################################################################
let g:auto_save = 1
let g:auto_save_silent = 1

"##############################################################################
" Floaterm
"##############################################################################
let g:floaterm_width = 0.99
let g:floaterm_height = 0.99
" let g:floaterm_width = 0.7
" let g:floaterm_height = 0.7
let g:floaterm_opener = 'edit'
nnoremap <silent> <c-o> :FloatermNew --title=Open lf<cr>
hi FloatermBorder ctermbg=None guibg=None

"##############################################################################
" Startify
"##############################################################################
let g:startify_custom_header = [
      \'     _   _                 _',
      \'    | \ | | ___  _____   _(_)_ __ ___  ',
      \'    |  \| |/ _ \/ _ \ \ / / | `_ ` _ \ ',
      \'    | |\  |  __/ (_) \ V /| | | | | | |',
      \'    |_| \_|\___|\___/ \_/ |_|_| |_| |_|',
      \''
      \]

augroup startify
  autocmd!
  autocmd User Startified setlocal cursorline
augroup END

nnoremap <silent> <c-k>f :SClose<cr>
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
      \ 'silent! NERDTreeClose'
      \ ]

"##############################################################################
" Surround
"##############################################################################
let g:surround_no_mappings=1
nmap dS <plug>Dsurround
nmap cS <plug>Csurround
nmap cSS <plug>CSurround
nmap yS <plug>Ysurround
nmap ySS <plug>Yssurround
xmap S <plug>VSurround
xmap gS <plug>VgSurround

"##############################################################################
" Easymotion
"##############################################################################
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0
map s <Plug>(easymotion-bd-f)
xmap s <Plug>(easymotion-bd-f)
omap s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-bd-f)
let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
xmap <leader>j <Plug>(easymotion-j)
omap <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
xmap <leader>k <Plug>(easymotion-k)
map <leader>k <Plug>(easymotion-k)

"##############################################################################
" NerdTree
"##############################################################################
nnoremap <silent> <c-b> :NERDTreeToggle<cr>
nnoremap <silent> <c-k><c-o> :NERDTree<cr>
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['\.meta$']
let g:NERDTreeMapToggleHidden = 'H'

augroup nerdtree
  autocmd!
  autocmd bufenter * call OnNERDTreeEnter()

  autocmd FileType nerdtree nnoremap <buffer> <tab> <nop>
  autocmd FileType nerdtree nnoremap <buffer> <s-tab> <nop>
  autocmd FileType nerdtree nnoremap <buffer> l <nop>
  autocmd FileType nerdtree nnoremap <buffer> h <nop>
  autocmd FileType nerdtree setlocal cursorline signcolumn=auto
  autocmd FileType nerdtree setlocal winwidth=30 winminwidth=25 winfixwidth

  autocmd VimEnter *
        \ if argc() == 1 && isdirectory(argv()[0]) |
        \   exec 'NERDTree' argv()[0] | wincmd p | enew | exec 'cd '.argv()[0] |
        \ endif
augroup END

function! OnNERDTreeEnter()
  if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree())
    if (len(getbufinfo({'buflisted':1})) == 0) | qa | endif
    bnext
    NERDTreeToggle
    wincmd w
  endif
endfunction

"##############################################################################
" fzf
"##############################################################################
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
" let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_preview_floating_window_rate = 0.7

let opts = {'source': 'find -type f'}
if executable('fd') | let opts.source='fd --type file --hidden' | endif
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(opts), <bang>0)

nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <a-tab> :Buffers<CR>
nnoremap <silent> <a-s> :Commands<cr>

"##############################################################################
" NerdCommenter
"##############################################################################
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
nnoremap <silent> yc :call nerdcommenter#Comment("n", "Toggle")<cr>
xnoremap <silent> yc :call nerdcommenter#Comment("x", "Toggle")<cr>
nnoremap <silent>  :call nerdcommenter#Comment("n", "Toggle")<cr>
vnoremap <silent>  :call nerdcommenter#Comment("n", "Toggle")<cr>

augroup nerdcommenter
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

"##############################################################################
" OmniSharp
"##############################################################################
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone,preview
let g:OmniSharp_highlight_types = 3

"##############################################################################
" ALE
"##############################################################################
let g:ale_linters = {
      \ 'cs': ['OmniSharp']
      \}
let g:ale_set_quickfix = 1

"##############################################################################
" WhichKey
"##############################################################################
let g:which_key_vertical = 0
let g:which_key_timeout = 20
let g:which_key_use_floating_win = 0
let g:which_key_fallback_to_native_key=1
highlight WhichKeyFloating guibg=None

"##############################################################################
" Peekaboo
"##############################################################################
let g:peekaboo_window = 'vert bo new'

"##############################################################################
" Asyncrun
"##############################################################################
let g:asyncrun_open = 10
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" command! -bang -bar -nargs=* Gpush execute 'AsyncRun<bang> -cwd=' .
"           \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
" command! -bang -bar -nargs=* Gfetch execute 'AsyncRun<bang> -cwd=' .
"           \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

" let g:asyncrun_status = ''
" let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"##############################################################################
" Quickrun
"##############################################################################
" nnoremap R <plug>(quickrun)
nnoremap <silent> R :QuickRun -runner shell<cr>
let g:quickrun_config = {}
" let g:quickrun_config.runner = 'shell'
" let g:quickrun_config.haskell = {'command' : 'runhugs'}

"##############################################################################
" Bbye
"##############################################################################
nnoremap <silent> <c-w> :Bdelete<cr>

"##############################################################################
" GoldenView
"##############################################################################
let g:goldenview__enable_default_mapping = 0

"##############################################################################
" coc
"##############################################################################
if !empty(glob(plugins_dir . '/coc.nvim'))
  set updatetime=1000
  set shortmess+=c

  command! -nargs=0 Editsnippets :CocCommand snippets.editSnippets

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ?
        \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  let g:coc_snippet_next = '<tab>'
  inoremap <silent><expr> <c-space> coc#refresh()
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  call coc#config('diagnostic.displayByAle', 'true')

  call coc#config('languageserver', {
        \  'ccls': {
        \    'command': 'ccls',
        \    'filetypes': ['c', 'cpp', 'cuda', 'objc', 'objcpp'],
        \    'rootPatterns': ['.ccls-root', 'compile_commands.json'],
        \    'initializationOptions': {
        \      'cache': {
        \        'directory': '.ccls-cache'
        \      }
        \    }
        \  }
        \})
endif
