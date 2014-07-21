" MightyPixel's vimrc ;)
"
" Date: 18.04.2013 Created by Ognyan Angelov
" Date: 08.11.2013 Updated to v 2.0

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set shell=bash


"set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
"filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
"set t_Co=256              " enable 256-color mode.
"syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme desert        " set colorscheme
"set number                " show line numbers
"set laststatus=2          " last window always has a statusline
"filetype indent on        " activates indenting for files
"set nohlsearch            " Don't continue to highlight searched phrases.
"set incsearch             " But do highlight as you type your search.
"set ignorecase            " Make searches case-insensitive.
"set ruler                 " Always show info along bottom.
"set autoindent            " auto-indent
"set tabstop=4             " tab spacing
"set softtabstop=4         " unify
"set shiftwidth=4          " indent/outdent by 4 columns
"set shiftround            " always indent/outdent to the nearest tabstop
"set expandtab             " use spaces instead of tabs
"set smarttab              " use tabs at the start of a line, spaces elsewhere
"set nowrap                " don't wrap text

" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
       
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list 

fu! UseSpaces()
    set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

    set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
     
    set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                        " Spaces are used in indents with the '>' and '<' commands
                        " and when 'autoindent' is on. To insert a real tab when
                        " 'expandtab' is on, use CTRL-V <Tab>.
endfunction

fu! UseTabs()
    set noexpandtab
    set tabstop=4
    set shiftwidth=4
endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\node_modules$'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

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

filetype plugin indent on
syntax on

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = ['jshint']

colorscheme jellybeans
set guiheadroom=0

" Rebind <Leader> key
let mapleader = ";"

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

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

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

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Search
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

set nocompatible

" Useful settings
set history=700
set undolevels=700

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
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
