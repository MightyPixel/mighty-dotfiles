" MightyPixel's vimrc ;)
"
" Date: 18.04.2013 Created by Ognyan Angelov
" Date: 08.11.2013 Updated to v 2.0
"
" Sources 
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://github.com/amix/vimrc/blob/master/vimrcs/extended.vim

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

" FILES:
" For multi-byte character support (CJK support, for example):
" set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"
" Use Unix as the standard file type
set ffs=unix,dos,mac

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
cmap w!! w !sudo tee % >/dev/null
set autochdir " change into the folder of the file of the buffer


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

filetype plugin indent on
autocmd filetype python set expandtab

syntax on                 " Vim  overrule your settings with the defaults
syntax enable             " enable syntax highlighting (previously syntax on).


" USEFUL SETTINGS:
set shell=bash
set history=700
set undolevels=700

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Close all the
" buffers
map <leader>ba :1,1000 bd!<cr>
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed


" Rebind <Leader> key
let mapleader = ";"
map <Leader>r <esc>:so $MYVIMRC<CR>
nmap <leader>w :w!<cr>
" command W w !sudo tee % > /dev/null " :W sudo saves the file 

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>
map <C-T> <esc>:tabnew<CR>

vnoremap <Leader>s :sort<CR> " map sort function to a key

" Search
map <F4> :Ack <cword>        " Search
" Bind nohl
" Removes highlight of your last search
noremap <Leader>n :nohl<CR>  " Clear hightlight
vnoremap <Leader>n :nohl<CR> " Clear hightlight
" inoremap <C-n> :nohl<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" USER INTERFACE:
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

set ruler

" Turn on the WiLd menu
set wildmenu

"" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " show whitespace
" set list 
set list
set listchars=tab:\|-,trail:_,extends:#,nbsp:_


set laststatus=2           "  last window always has a statusline
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    set t_Co=256           "  enable 256-color mode.
endif


" colorscheme jellybeans
" colorscheme desert
" colorscheme ron 
colorscheme wombat256
set background=dark
set guiheadroom=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

set softtabstop=4 " unify
set shiftwidth=4  " Number of spaces to use for each step of (auto)indent.
set tabstop=4     " Number of spaces that a <Tab> in the file counts for.
set shiftround    " always indent/outdent to the nearest tabstop
set smarttab      " use tabs at the start of a line, spaces elsewhere
set nowrap        " don't wrap text

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

fu! UseSpaces()
    set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                        " Spaces are used in indents with the '>' and '<' commands
                        " and when 'autoindent' is on. To insert a real tab when
                        " 'expandtab' is on, use CTRL-V <Tab>.
endfunction

fu! UseTabs()
    set noexpandtab
endfunction


" COMMANDS:
vnoremap r "_dP
vnoremap <Leader>d \"_d


set autoindent
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
" set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

" PLUGINS:
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = ['jshint']

" paste colour -> :ColorHEX / :ColorRGB
let g:colorpicker_app = 'iTerm.app'

" Pathogen
set runtimepath+=~/Users/shambhala/Development/mighty-dotfiles/vim/autoload
execute pathogen#infect()

" TList
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-o> :TlistToggle<CR>

" Easymotion
" let g:EasyMotion_leader_key = '<Leader>'
" NERDTree
nmap <Leader>t :NERDTreeToggle<CR>


" Settings for ctrlp
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\node_modules$'
let g:ctrlp_custom_ignore = '\v[\/]\bower_components$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_max_height = 30

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


set wildignore+=*_build/*
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=*/coverage/*

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

" Settings for tabularize
" if exists(":Tabularize")
    nmap <Leader>a= :Tab /=<CR>
    vmap <Leader>a= :Tab /=<CR>
    nmap <Leader>a/ :Tab /\/\/<CR>
    vmap <Leader>a/ :Tab /\/\/<CR>
    nmap <Leader>a: :Tab /:\zs<CR>
    vmap <Leader>a: :Tab /:\zs<CR>
    nmap <Leader>a" :Tab /"<CR>
    vmap <Leader>a" :Tab /"<CR>
" endif

" settings for tagbar
nmap <F8> :TagbarToggle<CR>

" settings for davidhalter/jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0


" settings for omnicomplete
" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" LANGUAGE SPECIFIC:
" Python:
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
