" Enable vim-plug.
call plug#begin('~/.vim/vim-plug')

" tpope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" etc
Plug 'altercation/vim-colors-solarized'
Plug 'derekwyatt/vim-scala'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'
Plug 'airblade/vim-gitgutter'
Plug 'shime/vim-livedown'

" coc.nvim and plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system.
call plug#end()
