set cursorline
set hidden
set ignorecase
set number
set smartcase
set termguicolors
set undofile
" Some servers have issues with backup files, see #649.
set nobackup
set noswapfile
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

let mapleader=" "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ianks/vim-tsx'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'digitaltoad/vim-pug'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#ale#enabled = 1


let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

inoremap fd <esc>
cnoremap fd <esc>
vnoremap fd <esc>

" if isdirectory(argv()[0]) > 0
"   call defx#custom#option('_', {
"         \ 'winwidth': 30,
"         \ 'split': 'vertical',
"         \ 'direction': 'topleft',
"         \ 'show_ignored_files': 0,
"         \ 'toggle': 1,
"         \ })
"   call defx#do_action('open_tree', 'toggle')
" endif
" call defx#do_action('open_tree', 'toggle')


hi Comment gui=italic cterm=italic term=italic
highlight Include gui=italic
highlight htmlArg gui=italic
highlight Keyword gui=italic
highlight Special gui=italic

" Defx shortcuts
" Set appearance
set splitright
set splitbelow
" nnoremap <silent> <C-e> :Defx -columns=git:icons:indent:filename:type <CR>
" call defx#custom#option('_', {
"       \ 'winwidth': 30,
"       \ 'split': 'vertical',
"       \ 'direction': 'topleft',
"       \ 'show_ignored_files': 0,
"       \ 'buffer_name': 'defxplorer',
"       \ 'toggle': 1,
"       \ 'resume': 1,
"       \ })
" augroup defxOnOpenDirectory
"     au!
"     au VimEnter * sil! au! FileExplorer *
"     au BufEnter * if s:isdir(expand('%')) | bd | exe 'Defx -columns=git:icons:indent:filename:type' | endif
" augroup END

" fu! s:isdir(dir) abort
"     return !empty(a:dir) && (isdirectory(a:dir) ||
"                 \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
" endfu

" autocmd FileType defx call s:defx_my_settings()
" function! s:defx_my_settings() abort
"   " Define mappings
"   nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', 'open')
"   nnoremap <silent><buffer><expr> c
"   \ defx#do_action('copy')
"   nnoremap <silent><buffer><expr> m
"   \ defx#do_action('move')
"   nnoremap <silent><buffer><expr> p
"   \ defx#do_action('paste')
"   nnoremap <silent><buffer><expr> l
"   \ defx#do_action('open')

"   nnoremap <silent><buffer><expr> i    defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
"   nnoremap <silent><buffer><expr> s    defx#do_action('multi', [['drop', 'split'], 'quit'])

"   nnoremap <silent><buffer><expr> P
"   \ defx#do_action('open', 'pedit')
"   nnoremap <silent><buffer><expr> o defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop', 'quit'])

"   nnoremap <silent><buffer><expr> K
"   \ defx#do_action('new_directory')
"   nnoremap <silent><buffer><expr> N
"   \ defx#do_action('new_file')
"   nnoremap <silent><buffer><expr> M
"   \ defx#do_action('new_multiple_files')
"   nnoremap <silent><buffer><expr> C
"   \ defx#do_action('toggle_columns',
"   \                'mark:indent:icon:filename:type:size:time')
"   nnoremap <silent><buffer><expr> S
"   \ defx#do_action('toggle_sort', 'time')
"   nnoremap <silent><buffer><expr> d
"   \ defx#do_action('remove')
"   nnoremap <silent><buffer><expr> r
"   \ defx#do_action('rename')
"   nnoremap <silent><buffer><expr> !
"   \ defx#do_action('execute_command')
"   nnoremap <silent><buffer><expr> x
"   \ defx#do_action('execute_system')
"   nnoremap <silent><buffer><expr> yy
"   \ defx#do_action('yank_path')
"   nnoremap <silent><buffer><expr> .
"   \ defx#do_action('toggle_ignored_files')
"   nnoremap <silent><buffer><expr> ;
"   \ defx#do_action('repeat')
"   nnoremap <silent><buffer><expr> h
"   \ defx#do_action('cd', ['..'])
"   nnoremap <silent><buffer><expr> ~
"   \ defx#do_action('cd')
"   nnoremap <silent><buffer><expr> q
"   \ defx#do_action('quit')
"   nnoremap <silent><buffer><expr> <Space>
"   \ defx#do_action('toggle_select') . 'j'
"   nnoremap <silent><buffer><expr> *
"   \ defx#do_action('toggle_select_all')
"   nnoremap <silent><buffer><expr> j
"   \ line('.') == line('$') ? 'gg' : 'j'
"   nnoremap <silent><buffer><expr> k
"   \ line('.') == 1 ? 'G' : 'k'
" "  nnoremap <silent><buffer><expr> <C-l>
" "  \ defx#do_action('redraw')
"   nnoremap <silent><buffer><expr> <C-g>
"   \ defx#do_action('print')
"   nnoremap <silent><buffer><expr> cd
"   \ defx#do_action('change_vim_cwd')
" endfunction
"
"defx from https://github.com/rafi/vim-config/blob/master/config/plugins/defx.vim
" :h defx
" ---
" Problems? https://github.com/Shougo/defx.nvim/issues

nnoremap <silent> <C-e> :Defx -toggle <CR>

fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
                \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu
augroup defxOnOpenDirectory
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Defx -columns=git:icons:indent:filename:type' | endif
augroup END
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'columns': 'indent:git:icons:filename:type',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': 'defxplorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })
" call defx#custom#option('_', {
" 	\ 'resume': 1,
" 	\ 'winwidth': 25,
" 	\ 'split': 'vertical',
" 	\ 'direction': 'topleft',
" 	\ 'show_ignored_files': 0,
" 	\ 'columns': 'indent:git:icons:filename',
" 	\ 'root_marker': '',
" 	\ 'ignored_files':
" 	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
" 	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
" 	\ })

" call defx#custom#column('git', {
" 	\   'indicators': {
" 	\     'Modified'  : '‚Ä¢',
" 	\     'Staged'    : '‚úö',
" 	\     'Untracked' : '·µÅ',
" 	\     'Renamed'   : '‚â´',
" 	\     'Unmerged'  : '‚â†',
" 	\     'Ignored'   : '‚Å±',
" 	\     'Deleted'   : '‚úñ',
" 	\     'Unknown'   : '‚Åá'
" 	\   }
" 	\ })

call defx#custom#column('mark', { 'readonly_icon': 'ÔÄ£', 'selected_icon': 'ÔêÆ' })
call defx#custom#column('filename', { 'root_marker_highlight': 'Comment' })

" defx-icons plugin
let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = 'ÔêÆ'

" Internal use
let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')

" Events
" ---

augroup user_plugin_defx
	autocmd!

	" Define defx window mappings
	autocmd FileType defx call <SID>defx_mappings()

	" Delete defx if it's the only buffer left in the window
	autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

	" Move focus to the next window if current buffer is defx
	autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

	" autocmd WinEnter * if &filetype ==# 'defx'
	"	\ |   silent! highlight! link CursorLine TabLineSel
	"	\ | endif
	"
	" autocmd WinLeave * if &filetype ==# 'defx'
	"	\ |   silent! highlight! link CursorLine NONE
	"	\ | endif

augroup END

" Internal functions
" ---

function! s:jump_dirty(dir) abort
	" Jump to the next position with defx-git dirty symbols
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_tree', ['nested', 'toggle'])
	endif
	return defx#do_action('multi', ['drop', 'quit'])
endfunction

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no expandtab

	nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
  nnoremap <silent><buffer><expr> o defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('multi', ['drop', 'quit'])
	nnoremap <silent><buffer><expr> h     defx#do_action('close_tree')
	nnoremap <silent><buffer><expr> t     defx#do_action('open_tree', 'recursive')
	nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
	nnoremap <silent><buffer><expr> i     defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
	nnoremap <silent><buffer><expr> s     defx#do_action('multi', [['drop', 'split'], 'quit'])
	nnoremap <silent><buffer><expr> P     defx#do_action('preview')
	nnoremap <silent><buffer><expr> y     defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> gx    defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')

	" Defx's buffer management
	nnoremap <silent><buffer><expr> q      defx#do_action('quit')
	nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
	nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

	" File/dir management
	nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
	nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
	nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
	nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
	nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
	nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

	" Jump
	nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
	nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>

	" Change directory
	nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
	nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
	nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
	nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

	" Selection
	nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr><nowait> <Space>
		\ defx#do_action('toggle_select') . 'j'

	nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
	nnoremap <silent><buffer><expr> C
		\ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')

	" Tools
	nnoremap <silent><buffer><expr> w   defx#do_action('call', '<SID>toggle_width')
	nnoremap <silent><buffer><expr> gd  defx#async_action('multi', ['drop', 'quit', ['call', '<SID>git_diff']])
	nnoremap <silent><buffer><expr> gr  defx#do_action('call', '<SID>grep')
	nnoremap <silent><buffer><expr> gf  defx#do_action('call', '<SID>find_files')
	if exists('$TMUX')
		nnoremap <silent><buffer><expr> gl  defx#async_action('call', '<SID>explorer')
	endif
endfunction

" TOOLS
" ---

function! s:git_diff(context) abort
	Gdiffsplit
endfunction

function! s:find_files(context) abort
	" Find files in parent directory with Denite
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	silent execute 'wincmd w'
	silent execute 'Denite file/rec:'.l:parent
endfunction

function! s:grep(context) abort
	" Grep in parent directory with Denite
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	silent execute 'wincmd w'
	silent execute 'Denite grep:'.l:parent
endfunction

function! s:toggle_width(context) abort
	" Toggle between defx window width and longest line
	let l:max = 0
	for l:line in range(1, line('$'))
		let l:len = strdisplaywidth(substitute(getline(l:line), '\s\+$', '', ''))
		let l:max = max([l:len + 1, l:max])
	endfor
	let l:new = l:max == winwidth(0) ? s:original_width : l:max
	call defx#call_action('resize', l:new)
endfunction

function! s:explorer(context) abort
	" Open file-explorer split with tmux
	let l:explorer = s:find_file_explorer()
	if empty('$TMUX') || empty(l:explorer)
		return
	endif
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	let l:cmd = 'split-window -p 30 -c ' . l:parent . ' ' . l:explorer
	silent execute '!tmux ' . l:cmd
endfunction

function! s:find_file_explorer() abort
	" Detect terminal file-explorer
	let s:file_explorer = get(g:, 'terminal_file_explorer', '')
	if empty(s:file_explorer)
		for l:explorer in ['lf', 'hunter', 'ranger', 'vifm']
			if executable(l:explorer)
				let s:file_explorer = l:explorer
				break
			endif
		endfor
	endif
	return s:file_explorer
endfunction

" end of defx


" CoC config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ultisnips
let g:UltiSnipsExpandTrigger = "<NUL>"

" ale
let g:ale_completion_enabled = 0
let g:ale_linters = {'go': ['golangci-lint']}
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}

" fzf
nnoremap <silent> <C-p> :GFiles --cached --others --exclude-standard<CR>
nnoremap <silent><C-a> :Rg<CR>

" function! s:open_defx_if_directory()
"   if !exists('g:loaded_defx')
"     echom 'Defx not installed, skipping...'
"     return
"   endif
"   if isdirectory(expand(expand('%:p')))
"     Defx `expand('%:p')`
"         \ -buffer-name=defx
"         \ -columns=mark:git:indent:icons:filename:type
"   endif
" endfunction

" augroup defx_config
"   autocmd!
"   " autocmd FileType defx call s:defx_my_settings()

"   " It seems like BufReadPost should work for this, but for some reason, I can't
"   " get it to fire. BufEnter seems to be more reliable.
"   autocmd BufEnter * call s:open_defx_if_directory()
" augroup END
"
" 
" function! s:open_defx_if_directory()
"   if !exists('g:loaded_defx')
"     echom 'Defx not installed, skipping...'
"     return
"   endif
"   if isdirectory(expand(expand('%:p')))
"     Defx `expand('%:p')`
"         \ -buffer-name=defx
"         \ -columns=mark:git:indent:icons:filename:type
"   endif
" endfunction

" function! s:defx_buffer_settings() abort
"   " Define mappings
"   for [key, value] in g:custom_defx_mappings
"     execute 'nnoremap <silent><buffer><expr> ' . key . ' ' . value
"   endfor
"   nnoremap <silent><buffer> ?
"         \ :for [key, value] in g:custom_defx_mappings <BAR>
"         \ echo '' . key . ': ' . value <BAR>
"         \ endfor<CR>
" endfunction

" augroup defx_settings
"   autocmd!
"   autocmd BufEnter * call s:open_defx_if_directory()
"   " autocmd FileType defx call s:defx_buffer_settings()
"   autocmd FileType defx setlocal cursorline
"   autocmd BufLeave,BufWinLeave \[defx\]* silent call defx#call_action('add_session')
" augroup END
autocmd FileType defx let t:defx_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInDefx()

function! PreventBuffersInDefx()
  if bufname('#') =~ 'defxplorer-0' && bufname('%') !~ 'defxplorer-0'
    \ && exists('t:defx_winnr') && bufwinnr('%') == t:defx_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

" set autoread
" au FocusGained * :checktime

autocmd FileType gitcommit execute "silent! CocDisable"
"local w = vim.loop.new_fs_poll()
"local function on_change(bufNr, filePath)
"  vim.api.nvim_command('checktime ' .. bufNr)
"  w:stop()
"  watch_file(bufNr, filePath)
"end
"function watch_file(bufNr, filePath)
"  w:start(filePath, 1000, vim.schedule_wrap(function(...)
"    on_change(bufNr, filePath) end))
"end
"vim.api.nvim_command(
"  "command! -nargs=0 Watch call luaeval('watch_file(_A[1], _A[2])', [bufnr('%'), expand('%:p')])")

augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
    endif
augroup END

set guicursor=a:blinkon100

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1

let g:ale_fixers = {
      \ 'go': ['gofmt', 'goimports']
      \ }
let g:ale_fix_on_save = 1

