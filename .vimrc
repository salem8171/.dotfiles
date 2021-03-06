" Check missing dependancies if missing
if !executable('node')
  if match(system('uname -a'), '\c'.'archlinux\|manjaro') != -1
    echo 'Installing node...'
    let $password = inputsecret('[sudo] password: ')
    !echo $password | sudo -S pacman --noconfirm -Syu nodejs npm yarn
    let $password = ''
  elseif match(system('uname -a'), '\c'.'ubuntu\|debian\|raspbian') != -1
    echo 'Installing node...'
    let $password = inputsecret('[sudo] password: ')
    !echo $password | sudo -S apt-get install node nodejs npm yarn
    let $password = ''
  endif
endif

" Install plugins if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/neoclide/coc.nvim',
      \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/junegunn/fzf'
Plug 'https://github.com/junegunn/fzf.vim'
" Plug 'https://github.com/iamcco/markdown-preview.nvim',
"       \ { 'do': { -> mkdp#util#install() } }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'https://github.com/mcmartelle/vim-monokai-bold'
" Plug 'https://github.com/francoiscabrol/ranger.vim'
" Plug 'https://github.com/rbgrouleff/bclose.vim'
" Plug 'https://github.com/SirVer/ultisnips'
" Plug 'https://github.com/honza/vim-snippets'
" Plug 'https://github.com/Yggdroot/indentLine'
" Plug 'https://github.com/thaerkh/vim-workspace'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/Chiel92/vim-autoformat'
" Plug 'https://github.com/yuttie/comfortable-motion.vim'
" Plug 'https://github.com/ryanoasis/vim-devicons'
" Plug 'https://github.com/edkolev/tmuxline.vim'
" Plug 'https://github.com/dkprice/vim-easygrep'
" Plug 'https://github.com/OmniSharp/omnisharp-vim'
" Plug 'https://github.com/mboughaba/i3config.vim'
" Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'

" coc extensions
Plug 'https://github.com/neoclide/coc-snippets',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-highlight',
"       \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/neoclide/coc-python',
      \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/neoclide/coc-pairs',
      \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/iamcco/coc-vimlsp',
"       \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/neoclide/coc-tsserver',
      \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-stylelint',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/bmatcuk/coc-stylelintplus',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-json',
"       \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/neoclide/coc-html',
      \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-css',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-java',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-yaml',
"       \ {'do': 'yarn install --frozen-lockfile'}
Plug 'https://github.com/neoclide/coc-emmet',
      \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-lists',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-git',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/iamcco/coc-angular',
"       \ {'do': 'npm install --no-package-lock'}
" Plug 'https://github.com/fannheyward/coc-xml',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/yatli/coc-powershell',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/fannheyward/coc-markdownlint',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/weirongxu/coc-explorer',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/fannheyward/coc-marketplace',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-tslint-plugin',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-tslint',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/voldikss/coc-template',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/fannheyward/coc-sql',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/iamcco/coc-gitignore',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/voldikss/coc-github',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-eslint',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/josa42/coc-docker',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-prettier',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/yatli/coc-omnisharp',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/jberglinds/coc-jira-complete',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/balta2ar/coc-jira',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/neoclide/coc-yank',
"       \ {'do': 'yarn install --frozen-lockfile'}
" Plug 'https://github.com/fannheyward/coc-terminal',
"       \ {'do': 'npm install --no-package-lock'}
call plug#end()

" let g:coc_global_extensions=[]

" filetype plugin on
" syntax on
colorscheme monokai-bold
highlight normal guibg=NONE ctermbg=NONE

" line numbers
set number relativenumber

" mouse support
set mouse=a

" comfirm saving before quitting
set confirm

" remap default leader to space
let mapleader = " "

" indentation settings
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" set showtabline=1
set noshowmode

" disable line wrapping
set nowrap

" disable search highlight
set nohlsearch

" Hightlight preferred text width column
set colorcolumn=80

" show the effects of commands (like substitute) as you type
set inccommand=split

" clipboard
" inoremap <c-v> <c-r>+
" vnoremap <c-c> "+y
" vnoremap <c-v> "+p
" vnoremap <c-x> "+d

" User friendly maps
" nnoremap  u
" inoremap  ua
" nnoremap <bs> a<BS>
" vnoremap <BS> c
" inoremap  dawa

" show help panes in vertical split
cabbrev h vert h

" natural splits
set splitbelow splitright

" Cursor line and column highlight
" set cursorline cursorcolumn
" au WinEnter * set cursorline cursorcolumn
" au WinLeave * set nocursorline nocursorcolumn

" Disable comment insertion on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Autoformat on buffer save
autocmd BufWritePre * :Autoformat
let g:autoformat_autoindent=0

autocmd FileType vim let b:autoformat_autoindent=1
autocmd FileType desktop let b:autoformat_autoindent=1

let g:formatdef_htmlbeautify =
      \'"html-beautify - -w ".&colorcolumn." -".(&expandtab ? "s ".shiftwidth() : "t")'
let g:formatdef_astyle_cs =
      \'"astyle --mode=cs --style=ansi --max-code-length=".&colorcolumn." --indent-namespaces -pcH".(&expandtab ? "s".shiftwidth() : "t")'

" use alt for splitting windows in a similiar way to i3
nnoremap <A-/> <c-w>v
" nnoremap <A-v> <c-w>v
nnoremap <A--> <c-w>s
" nnoremap <A-s> <c-w>s

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" resize split windows
nnoremap <AS-h> :vertical resize -1<cr>
nnoremap <AS-l> :vertical resize +1<cr>
nnoremap <AS-k> :resize -1<cr>
nnoremap <AS-j> :resize +1<cr>
tnoremap <AS-h> <c-\><c-n>:vertical resize -1<cr>
tnoremap <AS-l> <c-\><c-n>:vertical resize +1<cr>
tnoremap <AS-k> <c-\><c-n>:resize -1<cr>
tnoremap <AS-j> <c-\><c-n>:resize +1<cr>

" edit .virmrc on the fly
command! -nargs=0 Vimrc :edit ~/.vimrc

" terminal
nnoremap <leader>t :15split +term<cr>i
nnoremap <leader>vt :vsplit +term<cr>i
tnoremap ,<esc> <c-\><c-n>
autocmd BufEnter term://* startinsert
autocmd TermEnter * set nobuflisted

" buffers
nnoremap <tab> :bn<cr>
nnoremap <s-tab> :bp<cr>

""" Easymotion """
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
""" end of Easymotion """

""" Ranger """
" disable mapped shortcut for bclose (dependancy for ranger)
" let g:bclose_no_plugin_maps = 1

" disable default mapping for ranger which is redefined below
" let g:ranger_map_keys = 0

" prevent NERDTree from being open by default when opening folders
" let g:NERDTreeHijackNetrw = 0

" open ranger when editing folders
" let g:ranger_replace_netrw = 1

" ranger shortcut
" nnoremap <leader>r :Ranger<cr>
""" end of Ranger """

""" NerdTree """
" find current file in NERDTree
nnoremap <leader>n :NERDTreeFind<cr>

" Open NERDTree when opening folder
let g:NERDTreeHijackNetrw = 0

" show hidden files
let g:NERDTreeShowHidden = 1

" remove default clutter
let g:NERDTreeMinimalUI = 1

let g:NERDTreeIgnore = ['\.meta$']

" close vim if the last open buffer is NERDTree
" autocmd bufenter *
"       \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
"       \     q |
"       \ endif

" Open NERDTree when opening a directory
autocmd VimEnter *
      \ if argc() == 1 && isdirectory(argv()[0]) |
      \     exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] |
      \ endif
""" end of NerdTree """

""" fzf """
" reduce default height
let g:fzf_layout = { 'down': '~23%' }

" open a file
command! Files :call fzf#run(fzf#wrap({
      \ 'source': 'fd --type file --hidden --no-ignore'}))
nnoremap <leader>f :Files<CR>

" open a directory
" command! Directories :call fzf#run(fzf#wrap({
"       \ 'source': 'fd . $HOME --hidden --no-ignore --type d', 'sink': 'cd '}))
" nnoremap <leader>od :Directories<CR>

" open a recently opened file
nnoremap <leader>b :Buffers<CR>

" change the current buffer filetype
" nnoremap <leader>ft :Filetypes<CR>

" execute a command
nnoremap <leader>: :Commands<cr>
""" end of fzf """

""" Air line """
autocmd VimEnter * AirlineTheme peaksea
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
""" end of Air line """

""" NerdCommenter """
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Comment toggle mapping
nnoremap yc :call NERDComment("n", "Toggle")<cr>
xnoremap yc :call NERDComment("x", "Toggle")<cr>
nnoremap  :call NERDComment("n", "Toggle")<cr>
vnoremap  :call NERDComment("n", "Toggle")<cr>
""" end of NerdCommenter """

""" UltiSnip """
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-u>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
""" end of UltiSnip """

""" OmniSharp """
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
set completeopt=longest,menuone,preview
let g:OmniSharp_highlight_types = 3
""" end of OmniSharp """

""" Workspace """
" don't create tabs when reopening session
" let g:workspace_create_new_tabs = 0  " enabled = 1 (default), disabled = 0

" save all sessions in sessions folder instead of inside the workspace
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" mapping for toggling workspace
" nnoremap <leader>w :ToggleWorkspace<CR>

" Ignore empty buffers (Workaround for NERDTree errors on session restore)
" set sessionoptions-=blank
""" end of Workspace """

""" ALE """
let g:ale_linters = {
      \ 'cs': ['OmniSharp']
      \}
""" end of ALE """

""" coc """

" If hidden is not set, TextEdit might fail.
" set hidden

" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=500

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'vert h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current
" paragraph
" xmap <leader>a <Plug>(coc-codeaction-selected)
" nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of
" languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like:
" coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
" command! -nargs=0 OR :call CocAction('runCommand',
"       \ 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" Coc settings

call coc#config('diagnostic.displayByAle', 'true')

" ccls lsp configuration
call coc#config('languageserver', {
      \  'ccls': {
      \    "command": "ccls",
      \    "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
      \    "rootPatterns": [".ccls-root", "compile_commands.json"],
      \    "initializationOptions": {
      \      "cache": {
      \        "directory": ".ccls-cache"
      \      }
      \    }
      \  }
      \})
""" end of coc """
