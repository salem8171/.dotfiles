require('plugins')
local map = vim.api.nvim_set_keymap

-- ############################################################################
-- # General
-- ############################################################################
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.mouse = "a"
vim.o.confirm = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.showmode = false
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.foldmethod = "syntax"
vim.o.foldlevel = 15
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = "80"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10
vim.o.pumblend = 10
vim.o.diffopt = "internal,algorithm:histogram,indent-heuristic,filler,closeoff,iwhite"
vim.o.fillchars = "eob: ,diff: ,"
vim.o.inccommand = "split"
vim.o.updatetime = 1000
vim.o.shortmess = vim.o.shortmess.."c"
vim.o.lazyredraw = true
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.equalalways = true
vim.o.completeopt = "longest,menuone,preview"
vim.cmd [[let mapleader = ' ']]

vim.cmd [[
augroup signcolumn
  autocmd!
  autocmd FileType help lua vim.wo.signcolumn = "no"
augroup END
]]

vim.cmd [[
augroup cursorline
  autocmd!
  autocmd OptionSet diff lua if vim.wo.diff == true then vim.wo.cursorline = false end
  autocmd BufEnter * lua if vim.wo.diff == false then vim.wo.cursorline = true end
  autocmd BufLeave * lua vim.wo.cursorline = false
augroup END
]]


-- Emacs
map('i', '<c-b>', '<left>', { noremap = true })
map('i', '<c-f>', '<right>', { noremap = true })
map('c', '<c-a>', '<c-b>', { noremap = true })
map('c', '<c-b>', '<left>', { noremap = true })
map('c', '<c-f>', '<right>', { noremap = true })
map('c', '<c-g>', '<c-f>', { noremap = true })

-- Normie
map('i', '<c-v>', '<c-r>+', { noremap = true })
map('v', '<c-c>', '"+ygv', { noremap = true })
map('v', '<c-v>', '"+pgv', { noremap = true })
map('v', '<c-x>', '"+d', { noremap = true })
map('n', '<c-z>', 'u', { noremap = true })
map('i', '<c-z>', '<c-o>u', { noremap = true })
map('n', '<bs>', 'Xi', { noremap = true })
map('v', '<bs>', 'xi', { noremap = true })
map('', '<c-f>', '<esc>/', { noremap = true })
map('', '<c-h>', ':%s/', { noremap = true })
map('v', '<c-h>', ':s/', { noremap = true })
map('', '<c-a>', '<esc>ggVG', { noremap = true, silent = true })
map('', '<c-s>', '<esc>:w<cr>', { noremap = true, silent = true })
map('i', '<c-s>', '<c-o>:w<cr>', { noremap = true, silent = true })
map('', '<c-n>', '<esc>:enew<cr>', { noremap = true, silent = true })

-- Personal pref
map('v', 'y', 'ygv', { noremap = true })
map('v', 'p', 'pgv', { noremap = true })
map('n', '<cr>', 'o', { noremap = true })
map('', '<c-q>', '<esc>:quitall<cr>', { noremap = true, silent = true })
map('', '<a-q>', '<esc>:quit<cr>', { noremap = true, silent = true })
map('n', 'H', '<c-o>', { noremap = true })
map('n', 'L', '<c-i>', { noremap = true })
map('n', 'gJ', 'J', { noremap = true }) -- J is used for buffer movement
map('n', 'gK', 'K', { noremap = true }) -- K is used for buffer movement

-- ############################################################################
-- # Terminal
-- ############################################################################
map('t', '<esc><esc>', '<c-\\><c-n>', { noremap = true })
vim.cmd [[
augroup terminal
  autocmd!
  autocmd BufEnter term://* lua vim.cmd("startinsert")
  autocmd TermOpen * lua vim.cmd("startinsert")
  autocmd TermOpen * lua vim.bo.buflisted = false
  autocmd TermOpen * lua vim.wo.foldcolumn = "0"
  autocmd TermOpen * lua vim.wo.number = false
  autocmd TermOpen * lua vim.wo.relativenumber = false
  autocmd TermOpen * lua vim.wo.signcolumn = "no"
augroup END
]]

-- ############################################################################
-- # Window management
-- ############################################################################

-- Splits
map('', '<a-/>', '<esc><c-w>v', { noremap = true })
map('', '<a-->', '<esc><c-w>s', { noremap = true })
map('i', '<a-/>', '<c-o><c-w>v', { noremap = true })
map('i', '<a-->', '<c-o><c-w>s', { noremap = true })
map('t', '<a-/>', '<c-\\><c-n><c-w>vi', { noremap = true })
map('t', '<a-->', '<c-\\><c-n><c-w>vs', { noremap = true })

-- Movement
map('n', '<s-tab>', '&buflisted ? ":bprevious<cr>" : "<nop>"', { noremap = true, silent = true, expr = true })
map('n', '<tab>', '&buflisted ? ":bnext<cr>" : "<nop>"', { noremap = true, silent = true, expr = true })
map('n', 'J', '&buflisted ? ":bprevious<cr>" : "<nop>"', { noremap = true, silent = true, expr = true })
map('n', 'K', '&buflisted ? ":bnext<cr>" : "<nop>"', { noremap = true, silent = true, expr = true })
map('', '<a-h>', '<esc><c-w>h', { noremap = true })
map('', '<a-j>', '<esc><c-w>j', { noremap = true })
map('', '<a-k>', '<esc><c-w>k', { noremap = true })
map('', '<a-l>', '<esc><c-w>l', { noremap = true })
map('i', '<a-h>', '<esc><c-w>h', { noremap = true })
map('i', '<a-j>', '<esc><c-w>j', { noremap = true })
map('i', '<a-k>', '<esc><c-w>k', { noremap = true })
map('i', '<a-l>', '<esc><c-w>l', { noremap = true })
map('t', '<a-h>', '<c-\\><c-n><c-w>h', { noremap = true })
map('t', '<a-j>', '<c-\\><c-n><c-w>j', { noremap = true })
map('t', '<a-k>', '<c-\\><c-n><c-w>k', { noremap = true })
map('t', '<a-l>', '<c-\\><c-n><c-w>l', { noremap = true })

-- Resizing
map('', '<as-h>', '<esc>3<c-w><', { noremap = true })
map('', '<as-l>', '<esc>3<c-w>>', { noremap = true })
map('', '<as-k>', '<esc>3<c-w>-', { noremap = true })
map('', '<as-j>', '<esc>3<c-w>+', { noremap = true })
map('i', '<as-h>', '<c-o>3<c-w><', { noremap = true })
map('i', '<as-l>', '<c-o>3<c-w>>', { noremap = true })
map('i', '<as-k>', '<c-o>3<c-w>-', { noremap = true })
map('i', '<as-j>', '<c-o>3<c-w>+', { noremap = true })
map('t', '<as-h>', '<c-\\><c-n>3<c-w><i', { noremap = true })
map('t', '<as-l>', '<c-\\><c-n>3<c-w>>i', { noremap = true })
map('t', '<as-k>', '<c-\\><c-n>3<c-w>-i', { noremap = true })
map('t', '<as-j>', '<c-\\><c-n>3<c-w>+i', { noremap = true })

-- ############################################################################
-- # Airline
-- ############################################################################
vim.g.airline_theme = 'monokaish'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
vim.g.airline_stl_path_style = 'short'

local airline_symbols = vim.g.airline_symbols or {}
airline_symbols.colnr = 'Col'
airline_symbols.linenr = ' Ln'
airline_symbols.maxlinenr = ' '
airline_symbols.crypt = '[crypt]'
airline_symbols.whitespace = 'Ξ'
vim.g.airline_symbols = airline_symbols

-- ############################################################################
-- # Autoformat
-- ############################################################################
vim.g.autoformat_autoindent = 0

map('', '<c-a-f>', '<esc>:Autoformat<cr>', { noremap = true, silent = true })
map('i', '<c-a-f>', '<o>:Autoformat<cr>', { noremap = true, silent = true })

vim.cmd [[
augroup autoformat
  autocmd!
  autocmd FileType vim lua vim.b.autoformat_autoindent = 1
  autocmd FileType desktop lua vim.b.autoformat_autoindent = 1
augroup END
]]

vim.g.formatdef_htmlbeautify = '"html-beautify - -w ".&colorcolumn." -".(&expandtab ? "s ".shiftwidth() : "t")'
vim.g.formatdef_astyle_cs = '"astyle --mode=cs --style=ansi --max-code-length=".&colorcolumn." --indent-namespaces -pcH".(&expandtab ? "s".shiftwidth() : "t")'

-- ############################################################################
-- # Autosave
-- ############################################################################
vim.g.auto_save = 1
vim.g.auto_save_silent = 1

-- ############################################################################
-- # Fugitive
-- ############################################################################
vim.cmd [[
augroup fugitive_user
  autocmd!
  autocmd FileType fugitive lua vim.bo.buflisted = false
augroup END
]]

-- ############################################################################
-- # Floaterm
-- ############################################################################
vim.g.floaterm_width = 0.85
vim.g.floaterm_height = 0.85
vim.g.floaterm_opener = 'edit'
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'

map('n', '<c-o>', ':FloatermNew --title=Open lf<cr>', { noremap = true, silent = true })

-- ############################################################################
-- # Startify
-- ############################################################################
vim.g.startify_session_persistence = 1
vim.g.startify_session_before_save = { 'silent! NERDTreeClose' }
vim.g.startify_custom_header = {
  [[     _   _                 _               ]],
  [[    | \ | | ___  _____   _(_)_ __ ___      ]],
  [[    |  \| |/ _ \/ _ \ \ / / | `_ ` _ \     ]],
  [[    | |\  |  __/ (_) \ V /| | | | | | |    ]],
  [[    |_| \_|\___|\___/ \_/ |_|_| |_| |_|    ]],
  [[                                           ]]
}

map('n', '<c-k>f', ':SClose<cr>', { noremap = true, silent = true })

vim.cmd [[
augroup startify
  autocmd!
  autocmd User Startified lua vim.wo.cursorline = true
augroup END
]]

-- ############################################################################
-- # Surround
-- ############################################################################
vim.g.surround_no_mappings = 1

map('n', 'dS', '<plug>Dsurround', {})
map('n', 'cS', '<plug>Csurround', {})
map('n', 'cSS', '<plug>CSurround', {})
map('n', 'yS', '<plug>Ysurround', {})
map('n', 'ySS', '<plug>Yssurround', {})
map('x', 'S', '<plug>VSurround', {})
map('x', 'gS', '<plug>VgSurround', {})

-- ############################################################################
-- # Easymotion
-- ############################################################################
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1

map('', '<leader>', '<plug>(easymotion-prefix)', {})
map('', 's', '<Plug>(easymotion-bd-f)', {})
map('', '<leader>j', '<Plug>(easymotion-j)', {})
map('', '<leader>k', '<Plug>(easymotion-k)', {})
map('x', 's', '<Plug>(easymotion-bd-f)', {})
map('x', '<leader>j', '<Plug>(easymotion-j)', {})
map('x', '<leader>k', '<Plug>(easymotion-k)', {})
map('o', 's', '<Plug>(easymotion-bd-f)', {})
map('o', '<leader>j', '<Plug>(easymotion-j)', {})
map('o', '<leader>k', '<Plug>(easymotion-k)', {})

-- ############################################################################
-- # NerdTree
-- ############################################################################
vim.g.NERDTreeHijackNetrw = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer=1
vim.g.NERDTreeIgnore = { [[\.meta$]] }
vim.g.NERDTreeMapToggleHidden = 'H'

map('n', '<c-b>', ':NERDTreeToggle<cr>', { noremap = true, silent = true })
map('n', '<c-k><c-o>', ':NERDTree<cr>', { noremap = true, silent = true })

function OnNERDTreeEnter()
  local fn = vim.fn
  if fn.winnr('$') == 1 and vim.b.NERDTree and vim.b.NERDTree._type == 'tab' then
    if fn.len(fn.getbufinfo({ buflisted = 1 })) == 0 then
      vim.cmd [[quitall]]
    end
    vim.cmd [[bnext]]
    vim.cmd [[NERDTreeToggle]]
    vim.cmd [[wincmd w]]
  end
end

function OnNERDTreeVimEnter()
  local fn = vim.fn
  if fn.argc() == 1 and fn.isdirectory(fn.argv(0)) == 1 then
    vim.cmd [[enew]]
    vim.cmd [[exec 'cd '.argv(0)]]
    vim.cmd [[exec 'NERDTree' argv(0)]]
    vim.cmd [[wincmd p]]
  end
end

vim.cmd [[
augroup nerdtree_user
  autocmd!
  autocmd BufEnter * lua OnNERDTreeEnter()
  autocmd VimEnter * lua OnNERDTreeVimEnter()
  autocmd FileType nerdtree lua vim.api.nvim_buf_set_keymap(0, 'n', 'l', '', {})
  autocmd FileType nerdtree lua vim.api.nvim_buf_set_keymap(0, 'n', 'h', '', {})
  autocmd FileType nerdtree lua vim.wo.cursorline = true
  autocmd FileType nerdtree lua vim.wo.signcolumn = 'auto'
  autocmd FileType nerdtree lua vim.o.winwidth = 30
  autocmd FileType nerdtree lua vim.o.winminwidth = 25
  autocmd FileType nerdtree lua vim.wo.winfixwidth = true
augroup END
]]

-- ############################################################################
-- # fzf
-- ############################################################################
vim.g.fzf_layout = { window = { width = 0.85, height = 0.85 } }
vim.g.fzf_preview_floating_window_rate = 0.7

map('n', '<c-p>', ':Files<cr>', { noremap = true, silent = true })
map('n', '<c-k>m', ':Filetypes<cr>', { noremap = true, silent = true })
map('n', '<a-tab>', ':Buffers<cr>', { noremap = true, silent = true })
map('n', '<a-s>', ':Commands<cr>', { noremap = true, silent = true })
map('n', '<a-c>', ':Commits<cr>', { noremap = true, silent = true })

function fzf_files(qargs)
  local opts
  if vim.fn.executable('fd') == 1 then
    opts = { source = 'fd --type file --hidden' }
  else
    opts = { source = 'find -type f' }
  end
  vim.fn['fzf#vim#files'](qargs, vim.fn['fzf#vim#with_preview'](opts), 0)
end

vim.cmd [[command! -nargs=? -complete=dir Files lua fzf_files(<q-args>)]]

-- ############################################################################
-- # NerdCommenter
-- ############################################################################
vim.g.NERDSpaceDelims = 1
vim.g.NERDCompactSexyComs = 1
vim.g.NERDDefaultAlign = 'left'
vim.g.NERDCommentEmptyLines = 0
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDToggleCheckAllLines = 1

map('n', 'yc', ':call nerdcommenter#Comment("n", "Toggle")<cr>', { noremap = true, silent = true })
map('n', '<c-_>', ':call nerdcommenter#Comment("n", "Toggle")<cr>', { noremap = true, silent = true })
map('x', 'yc', ':call nerdcommenter#Comment("x", "Toggle")<cr>', { noremap = true, silent = true })
map('x', '<c-_>', ':call nerdcommenter#Comment("x", "Toggle")<cr>', { noremap = true, silent = true })

vim.cmd [[
augroup nerdcommenter_user
  autocmd!
  autocmd BufEnter * lua vim.bo.formatoptions = vim.bo.formatoptions:gsub('c', '')
  autocmd BufEnter * lua vim.bo.formatoptions = vim.bo.formatoptions:gsub('r', '')
  autocmd BufEnter * lua vim.bo.formatoptions = vim.bo.formatoptions:gsub('o', '')
augroup END
]]

-- ############################################################################
-- # OmniSharp
-- ############################################################################
vim.g.OmniSharp_server_stdio = 1
vim.g.OmniSharp_timeout = 5
vim.g.OmniSharp_highlight_types = 3

-- ############################################################################
-- # ALE
-- ############################################################################
vim.g.ale_linters = { cs = { 'OmniSharp' } }
vim.g.ale_set_quickfix = 1

-- ############################################################################
-- # WhichKey
-- ############################################################################
vim.g.which_key_vertical = 0
vim.g.which_key_timeout = 20
vim.g.which_key_use_floating_win = 0
vim.g.which_key_fallback_to_native_key=1
vim.cmd [[highlight WhichKeyFloating guibg=None]]

-- ############################################################################
-- # Peekaboo
-- ############################################################################
vim.g.peekaboo_window = 'vert bo new'

-- ############################################################################
-- # Asyncrun
-- ############################################################################
vim.g.asyncrun_open = 10
vim.cmd [[
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
]]

-- ############################################################################
-- # Quickrun
-- ############################################################################
vim.g.quickrun_config = {}
-- map('', 'R', ':QuickRun -runner shell<cr>', { noremap = true, silent = true })
map('', 'R', ':QuickRun<cr>', { noremap = true, silent = true })

-- ############################################################################
-- # Bbye
-- ############################################################################
map('n', '<c-w>', ':Bdelete<cr>', { noremap = true, silent = true })

-- ############################################################################
-- # GoldenView
-- ############################################################################
vim.g.goldenview__enable_default_mapping = 0

-- ############################################################################
-- # coc
-- ############################################################################
vim.g.coc_snippet_next = '<tab>'

vim.cmd [[command! -nargs=0 Editsnippets :CocCommand snippets.editSnippets]]

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function is_space_prev_char()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.regex('\\s'):match_str(vim.fn.getline('.'):sub(col, col)) then
    return true
  end
  return false
end

function tab_completion()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['coc#_select_confirm']()
  elseif vim.fn['coc#expandableOrJumpable']() then
    return t"<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<cr>"
  elseif is_space_prev_char() then
    return t"<tab>"
  else
    return vim.fn['coc#refresh']()
  end
end

map('i', '<tab>', 'v:lua.tab_completion()', { noremap = true, expr = true })
map('i', '<c-space>', 'coc#refresh()', { noremap = true, expr = true })
map('i', '<cr>', 'pumvisible() ? "<c-y>" : "<c-g>u<cr>"', { noremap = true, expr = true })
map('n', 'gd', '<plug>(coc-definition)', { noremap = true })
map('n', 'gy', '<plug>(coc-type-definition)', { noremap = true })
map('n', 'gi', '<plug>(coc-implementation)', { noremap = true })
map('n', 'gr', '<plug>(coc-references)', { noremap = true })

if packer_plugins and packer_plugins["coc.nvim"] and packer_plugins["coc.nvim"].loaded then
  vim.fn['coc#config']('diagnostic.displayByAle', 'true')
  vim.fn['coc#config']('languageserver', {
      ccls = {
        command = 'ccls',
        filetypes = { 'c', 'cpp', 'cuda', 'objc', 'objcpp' },
        rootPatterns = { '.ccls-root', 'compile_commands.json' },
        initializationOptions = {
          cache = {
            directory = '.ccls-cache'
          }
        }
      }
    })
end
