" I like the leader as , rather than \ sm_com
let mapleader = ','

" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window for multiple buffers, and/or:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities.  As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
" set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
" set t_vb=

" Enable use of the mouse for all modes
" set mouse=n

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set noexpandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------

"-----------------------------------------------------------
" Sequoia's Stuff
"

" Status line
" :hi statuslinenc ctermbg=black
" :hi statuslinenc ctermfg=green
" :hi statusline ctermbg=white
" :hi statusline ctermfg=red


" colorcolumn
set colorcolumn=80
:hi colorcolumn ctermbg=gray

"highlight cake ctp files as php
au BufNewFile,BufRead *.ctp setfiletype php
au BufNewFile,BufRead *.less setfiletype less

"use jk for esc
:imap jk <Esc>

" Shortcut to rapidly toggle `set list` (show invisibles)
nmap <leader>l :set list!<CR>
" Shortcut for TagsList
nmap <special> <F8> :TlistToggle<cR>

" Use the same symbols as TextMate for tabstops and EOLs
" need unicode or something for this
set listchars=tab:▸\ ,eol:¬
let php_folding = 1

" " For pathogen:
" call pathogen#infect()
" " To generate helptags on any new plugins in the pathogen path:
" Helptags

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/vim_local_bundles')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" syntastic
Plugin 'scrooloose/syntastic'
" ^-configure
" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set t_Co=256
let g:Powerline_symbols = "fancy"
" surround
Plugin 'tpope/vim-surround'
" fugitive
Plugin 'tpope/vim-fugitive'
" unimpaired
Plugin 'tpope/vim-unimpaired'
" undotree
Plugin 'mbbill/undotree'
" ctrlp
Plugin 'kien/ctrlp.vim'
" yankring
Plugin 'vim-scripts/YankRing.vim'
nmap <leader>y :YRShow<CR>
" nerdtree
Plugin 'scrooloose/nerdtree'
map <F12> :NERDTreeToggle<CR>
" nerdcommenter
Plugin 'scrooloose/nerdcommenter'
" snippets
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"

	" If you want :UltiSnipsEdit to split your window.
	" let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set smarttab

" persistent undo
"set undofile

" allow tabbing with a single <
nmap < <<
nmap > >>
" allow it for visual mode (then reselect the section)
"vmap < <gv
"vmap > >gv

function! SetSoftTab(n)
    "for changing tabstops
    let &l:shiftwidth=a:n
    let &l:softtabstop=a:n
    let &l:expandtab=1
endfunction
	
function! SetHardTab()
    let &l:expandtab=0
    let &l:shiftwidth=4
endfunction

nmap <leader>t :TlistToggle<CR>
" maps to set tabstops quickly
nmap <leader>2 :call SetSoftTab(2)<CR>
nmap <leader>4 :call SetSoftTab(4)<CR>
nmap <leader>0 :call SetHardTab()<CR>
" change (.) to ( . )
nmap <leader>( cs((
" set paste to nopaste and back
" nmap <leader>p :set paste!<ENTER>

"toggle true to false
nore <expr> <leader>f expand('<cword>') ==# 'true' ? "ciwfalse\<Esc>" : (expand('<cword>') ==# 'false' ? "ciwtrue\<Esc>" : '')
"ftclip
"this is probably going to require writing a plugin
"map <leader>f :!. ~/.bashrc && echo shellescape( <C-r>" ) \| ftclip <CR>

" Ddiff functions
function ShowDiff(a,b)
    " I expect neither string to contain '@@'
    let start = matchstr(a:a.'@@'.a:b, '^\zs\(.*\)\ze.\{-}@@\1.*$')
    let end= matchstr(a:a.'@@'.a:b, '^.\{-}\zs\(.*\)\ze@@.\{-}\1$')
    let a = a:a[len(start): -len(end)-1]
    let b = a:b[len(start): -len(end)-1]
    echo "identical beginning: ".strlen(start )." chars -> ".start
    echo "identical ending   : ".strlen(end)." chars -> ".end
    echo "typical to a       : ".strlen(a)." chars -> ".a
    echo "typical to b       : ".strlen(b)." chars -> ".b
endfunction

let g:diffed_buffers=[]
function DiffText(a, b, diffed_buffers)
    enew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:a, "\n"))
    diffthis
    vnew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:b, "\n"))
    diffthis
endfunction
function WipeOutDiffs(diffed_buffers)
    for buffer in a:diffed_buffers
        execute 'bwipeout! '.buffer
    endfor
endfunction
nnoremap <special> <F7> :call DiffText(@a, @b, g:diffed_buffers)<CR>
nnoremap <special> <F8> :call WipeOutDiffs(g:diffed_buffers)<CR>

" NOT YET WORKING:
" Transposing {{{
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>
" End Transposing }}}
