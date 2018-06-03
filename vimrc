" Plugins
 if has("nvim")
  call plug#begin('~/.local/share/nvim/plugged')
else
   call plug#begin('~/.vim/plugged')
endif

Plug 'tpope/vim-fugitive'
" Plug 'vim-scripts/ag.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'tacahiroy/ctrlp-funky'
Plug 'scrooloose/nerdtree'
" Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
" Plug 'ervandew/supertab'
" Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
" Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'flazz/vim-colorschemes'
" Plug 'nazo/pt.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'elzr/vim-json'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/MatchTagAlways'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'mhartington/oceanic-next'
" Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'mhartington/nvim-typescript'
Plug 'morhetz/gruvbox'
Plug 'jreybert/vim-largefile'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh',
    \ }

call plug#end()
syntax enable

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

nmap <C-e> :NERDTreeToggle<cr>
set number
" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<cr>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsExpandTrigger		= "<tab>"
" let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" optional
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

let g:NERDSpaceDelims=1
let NERDTreeShowHidden=1
set termguicolors
" set background=dark
" let g:solarized_termtrans = 1
" colorscheme solarized8
" Airline
let g:airline_theme='gruvbox'
" let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" https://github.com/christoomey/vim-tmux-navigator/issues/83
let g:NERDTreeMapJumpNextSibling = '<Nop>'
let g:NERDTreeMapJumpPrevSibling = '<Nop>'
set completeopt-=preview

imap fd <Esc>

" CtrlP
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" let g:ctrlp_max_files=0
" let g:ctrlp_max_depth=40
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" let g:webdevicons_enable_ctrlp=1

" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'php', 'rb', 'js', 'ts', 'css', 'scss', 'less', 'html', 'md', 'xml', 'json']
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
let g:javascript_plugin_jsdoc = 1
" let g:ctrlp_extensions = ['tag']
nnoremap <c-f> :CtrlPFunky<Cr>

set backspace=2
set noswapfile

let g:indent_guides_enable_on_vim_startup = 1
set list lcs=tab:\|\ 
map j gj
map k gk
set ignorecase
set smartcase
set foldmethod=syntax
set nofoldenable
let g:vim_json_syntax_conceal = 0

let g:gruvbox_italic=1
set background=dark 
colorscheme gruvbox

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

let g:LargeFile = 1

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio']
    \ }
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

nnoremap <C-p> :GFiles<CR>
nnoremap <C-a> :Ag<CR>

autocmd BufNewFile,BufRead *.js setlocal filetype=typescript
" Persistent undo/redo
set undofile 
set undodir=~/.vim/undodir
