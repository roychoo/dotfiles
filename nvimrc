
" basic vim config
set number
set termguicolors
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=750

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

let mapleader = " "
" load vim plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'solarnz/thrift.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround',

Plug '/usr/local/opt/fzf'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'cocopon/iceberg.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'epilande/vim-react-snippets'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'morhetz/gruvbox'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'chriskempson/base16-vim'
Plug 'ElmCast/elm-vim'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
call plug#end()

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"   \ 'typescript': ['javascript-typescript-stdio'],
"   \ 'javascript': ['javascript-typescript-stdio']
"   \ }

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" colortheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" let g:gruvbox_italic=1
" set background=dark
" colorscheme gruvbox
" let g:palenight_terminal_italics=1

hi Comment gui=italic cterm=italic term=italic
highlight Include gui=italic
highlight htmlArg gui=italic
highlight Keyword gui=italic
highlight Special gui=italic

" NerdTree config
let NERDTreeShowHidden=1
nmap <c-e> :NERDTreeToggle<cr>
" nmap <c-p> :Files<cr>
" nmap <c-g> :Ag<cr>

" show indent tabs
" set list lcs=tab:\|\ 

" let g:ale_fixers = {
"   \ 'javascript': ['eslint'],
"   \ 'typescript': ['tslint']
"   \ }

" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <c-s> :call LanguageClient#textDocument_documentSymbol()<CR>
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹ ",
"     \ "Staged"    : "✚ ",
"     \ "Untracked" : "✭ ",
"     \ "Renamed"   : "➜ ",
"     \ "Unmerged"  : "═ ",
"     \ "Deleted"   : "✖ ",
"     \ "Dirty"     : "✗ ",
"     \ "Clean"     : "✔︎ ",
"     \ 'Ignored'   : '☒ ',
"     \ "Unknown"   : "? "
"     \ }

" disable C-j mapping in nerdtree, so that it doesnt conflict with the smart
" windows navigation
let g:NERDTreeMapJumpNextSibling="‚òª"
let g:NERDTreeMapJumpPrevSibling="‚ò∫"
let g:NERDTreeQuitOnOpen=1
inoremap fd <Esc>
nnoremap fd <Esc>
vnoremap fd <Esc>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codelens-action)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 '--color-path "1;36"',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use <C-l> for trigger snippet expand.
" imap <C-y> <Plug>(coc-snippets-expand)

" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <silent><C-a> :Ag<CR>
nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<CR>
let g:NERDTreeLimitedSyntax = 1
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

augroup nvim_term
  au!
  au TermOpen * startinsert
  au TermClose * stopinsert
augroup END

set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0
let g:indent_guides_enable_on_vim_startup = 1

let g:go_list_type="quickfix"
let g:go_fmt_command="goimports"
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
" let g:go_fmt_fail_silently=1
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
" let g:go_metalinter_command='golangci-lint'
" let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'staticcheck', 'typecheck', 'unused', 'varcheck']
" let g:go_metalinter_enabled = []
" let g:go_metalinter_enabled=["govet", "golint", "errcheck"]
 " let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "60s"
" let g:go_debug=['shell-commands']

let g:ale_linters = {'go': ['golint', 'gofmt', 'gobuild', 'staticcheck']}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
" highlight ALEErrorSign ctermbg=NONE ctermfg=red
" highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" let g:ale_go_go111module = 'on'
" let g:go_staticcheck_lint_package=1
let g:ale_go_staticcheck_lint_package = 1
let g:ale_go_staticcheck_options = '-checks=all'
" autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
let g:ale_fixers = {
    \ 'go': ['gofmt', 'goimports']
    \ }

" function! s:go_guru_scope_from_git_root()
"   let gitroot = system("git rev-parse --show-toplevel | tr -d '\n'")
"   let pattern = escape(go#util#gopath() . "/src/", '\ /')
"   return substitute(gitroot, pattern, "", "") . "/... -vendor/"
" endfunction

" au FileType go silent exe "GoGuruScope " . s:go_guru_scope_from_git_root()
let g:go_snippet_engine = ""
