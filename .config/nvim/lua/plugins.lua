-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'scrooloose/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'airblade/vim-gitgutter'
  use 'scrooloose/nerdcommenter'
  use 'junegunn/fzf'
  use 'vim-airline/vim-airline'
  use 'mcmartelle/vim-monokai-bold'
  use 'dense-analysis/ale'
  use 'Chiel92/vim-autoformat'
  use 'easymotion/vim-easymotion'
  use 'norcalli/nvim-colorizer.lua'
  use '907th/vim-auto-save'
  use 'mhinz/vim-startify'
  use 'sheerun/vim-polyglot'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf.vim'
  use 'liuchengxu/vim-which-key'
  use 'mboughaba/i3config.vim'
  use 'VebbNix/lf-vim'
  use 'junegunn/vim-peekaboo'
  use 'skywind3000/asyncrun.vim'
  use 'thinca/vim-quickrun'
  use 'moll/vim-bbye'
  use 'zhaocai/GoldenView.Vim'
  -- use { 'yuki-ycino/fzf-preview.vim', branch = 'release', run = ':UpdateRemotePlugins' }
  -- use 'vim-airline/vim-airline-themes'
  -- use 'dylanaraps/wal.vim'
  -- use 'thaerkh/vim-workspace'
  -- use 'ryanoasis/vim-devicons'
  -- use 'edkolev/tmuxline.vim'
  -- use 'dkprice/vim-easygrep'
  -- use 'OmniSharp/omnisharp-vim'

  use { 'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile' }
  use { 'pappasam/coc-jedi', branch = 'main', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile && yarn build' }
  use { 'neoclide/coc-pairs', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-tsserver', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-html', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-emmet', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  use { 'neoclide/coc-snippets', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  use { 'iamcco/coc-vimlsp', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }

  -- use { 'iamcco/coc-post', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-highlight', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-stylelint', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'bmatcuk/coc-stylelintplus', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-json', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-css', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-java', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-yaml', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-lists', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-git', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'iamcco/coc-angular', requires = {'neoclide/coc.nvim'}, run = 'npm install --no-package-lock' }
  -- use { 'fannheyward/coc-xml', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'yatli/coc-powershell', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'fannheyward/coc-markdownlint', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'weirongxu/coc-explorer', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'fannheyward/coc-marketplace', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-tslint-plugin', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-tslint', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'voldikss/coc-template', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'fannheyward/coc-sql', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'iamcco/coc-gitignore', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'voldikss/coc-github', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-eslint', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'josa42/coc-docker', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-prettier', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'yatli/coc-omnisharp', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'jberglinds/coc-jira-complete', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'balta2ar/coc-jira', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'neoclide/coc-yank', requires = {'neoclide/coc.nvim'}, run = 'yarn install --frozen-lockfile' }
  -- use { 'fannheyward/coc-terminal', requires = {'neoclide/coc.nvim'}, run = 'npm install --no-package-lock' }

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  max_jobs = 3,
  clone_timeout = 180,
  display = {
    working_sym = '*'
  }
}})
