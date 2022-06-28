set nocompatible

call plug#begin()

Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'sheerun/vim-polyglot'
Plug 'dstein64/vim-win'
Plug 'github/copilot.vim'

call plug#end()

" --- Vim plug commands
"  :PlugClean :PlugInstall :PlugUpdate

source ./plugin-config/gruvbox.vim
source ./plugin-config/coc.vim
source ./plugin-config/tagbar.vim
source ./plugin-config/nerdtree.vim