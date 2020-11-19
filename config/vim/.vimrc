set termguicolors
set mouse=a
set clipboard=unnamedplus
set number
set relativenumber
let mapleader = ','
let maplocalleader=","
set nocompatible

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab 
set nowrap
set scrolloff=10 " Gap from the top/bottom when scrolling
set splitbelow " Natural split
set splitright " Natural split
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set foldnestmax=2

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'kien/rainbow_parentheses.vim' " parentheses

" Theme
Plug 'bluz71/vim-nightfly-guicolors'

" Terraform plugin
Plug 'hashivim/vim-terraform' 

" git
Plug 'airblade/vim-gitgutter' " git

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python
Plug 'alfredodeza/pytest.vim' " pytest
Plug 'integralist/vim-mypy'  " Python mypy integration
Plug 'fisadev/vim-isort' " Isort
Plug 'jmcantrell/vim-virtualenv' " virtualenv
Plug 'psf/black', { 'branch': 'stable' } " black
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " Python syntax highlight

" airline
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes' " airline

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Syntax highlight
Plug 'sheerun/vim-polyglot'

call plug#end()

" Coc
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-eslint']
nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" List problems
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
" Remap keys for applying codeAction to the current line.
nmap <space>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <space>qf <Plug>(coc-fix-current)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Fzf
nnoremap <space><space> :FZF<cr>

" Shut off completion messages
set shortmess+=c

" Airline
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Common
syntax on
colorscheme nightfly
nnoremap <C-c><C-c> :noh<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
command W w
nnoremap <BS> <C-w>h  " https://github.com/neovim/neovim/issues/2048#issuecomment-77159983
nnoremap <C-h> <C-w>h

nnoremap gc :bdelete<cr>
nnoremap gn :bn<cr>
nnoremap gN :bp<cr>
nnoremap <leader>E :Ex<cr>

" Python config
let g:python_highlight_all = 1
autocmd FileType python nnoremap <leader>p :Pytest file verbose<cr>
autocmd FileType python nnoremap <leader>i :Isort<cr>
autocmd FileType python nnoremap <leader>b :Black<cr>
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab " formating for html files

" Markdown config
let g:vim_markdown_folding_disabled = 1
let g:tex_conceal = ""
let g:indentLine_conceallevel = 0

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab " formating for yaml files

" typescript + javascript
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2 expandtab " formating for ts files
autocmd FileType vue setlocal ts=2 sts=2 sw=2 expandtab " formating for vue files
autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab " formating for sass files
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab " formating for html files
let g:yats_host_keyword = 1
