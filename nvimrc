
" basic vim config
set number
set termguicolors
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" load vim plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'rakr/vim-one'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'mhartington/nvim-typescript', { 'do': 'sh install.sh' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()


let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'javascript': ['javascript-typescript-stdio']
  \ }

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" colortheme
let g:one_allow_italics = 1 
let g:airline_theme='one'
colorscheme one
set background=dark

highlight Include gui=italic
highlight htmlArg gui=italic
highlight Keyword gui=italic
highlight Special gui=italic

" NerdTree config
let NERDTreeShowHidden=1
nmap <c-e> :NERDTreeToggle<cr>
nmap <c-p> :Files<cr>
nmap <c-g> :Ag<cr>

" show indent tabs
set list lcs=tab:\|\ 

let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint']
  \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <c-s> :call LanguageClient#textDocument_documentSymbol()<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "? "
    \ }
