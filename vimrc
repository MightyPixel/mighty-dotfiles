" MightyPixel's vimrc ;)
"
" Date: 18.04.2013 Created by Ognyan Angelov
" Date: 08.11.2013 Updated to v 2.0
" Date: 14.08.2015 Updated to v 3.0
"
" Sources 
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://github.com/amix/vimrc/blob/master/vimrcs/extended.vim
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
"
" To do
" https://robots.thoughtbot.com/writing-clojure-in-vim
" https://www.shortcutfoo.com/app/dojos/vim/cheatsheet
" http://vim.rtorr.com/
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
"
" help
" :viusage
" :exusage
" :h quickref

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

set path=**

" FILES:
" For multi-byte character support (CJK support, for example):
" set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
"
" Use Unix as the standard file type
set ffs=unix,dos,mac
" Disable .swp files
" set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
cmap w!! w !sudo tee % >/dev/null
" set autochdir " change into the folder of the file of the buffer


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
" setlocal spell spelllang=en_us
" set complete+=kspell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red



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
map <Leader>R <esc>:so $MYVIMRC<CR>
nmap <leader>w :w!<cr>
" command W w !sudo tee % > /dev/null " :W sudo saves the file 

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
nnoremap <Leader>vr :vertical resize

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>mw :call WindowSwap#EasyWindowSwap()<CR>

" easier moving between tabs
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>
map <C-T> <esc>:tabnew<CR>
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>' viwc''<esc>P

vnoremap <Leader>s :sort<CR> " map sort function to a key

" Search
" map <F4> :Ack <cword>        " Search
nnoremap <leader>a :90vsplit<CR>:Ack ""<Left>
" let g:ack_autofold_results = 1
" let g:ackpreview = 1
nmap <leader><leader>f :tab split<CR>:grep -F '<C-r><C-w>' ./**/*.ts<CR>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>
nmap <leader>ra :Qargs <BAR> argdo %s/a/b/gc <BAR> update

noremap <S-Up> :cp<cr>
noremap <S-Down> :cn<cr>

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "vimgrep! '" . shellescape(@@) . "' ."
    copen

    let @@ = saved_unnamed_register
endfunction

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" Finds and replaces in files based on the the current line.
map <Leader>fr ^l"ayt/^v$h"byu:vsp<CR>:args `ack -l <C-R>a`<CR>:argdo " %s<C-R>bge \| update<CR>

" Same as above but asks before all the changes.
map <Leader>far ^l"ayt/^v$h"byu:vsp<CR>:args `ack -l <C-R>a`<CR>:argdo %s<C-R>bgce \| update<CR>

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
" set listchars=tab:\|---,trail:_,extends:#,nbsp:_
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

set laststatus=2           "  last window always has a statusline
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    set t_Co=256           "  enable 256-color mode.
endif

set background=dark

" colorscheme jellybeans
" colorscheme desert
" colorscheme ron 
" colorscheme wombat256
colorscheme material-theme

"
" colorscheme blazer
" colorscheme pencil
" set guiheadroom=0

au BufNewFile,BufRead *.ejs set filetype=html

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
" map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
    set shiftwidth=4
    set softtabstop=4
endfunction

fu! UseSpaces2()
    set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                        " Spaces are used in indents with the '>' and '<' commands
                        " and when 'autoindent' is on. To insert a real tab when
                        " 'expandtab' is on, use CTRL-V <Tab>.
    set shiftwidth=2
    set softtabstop=2
endfunction

fu! UseTabs()
    set noexpandtab
endfunction

fu! JsonFormat()
  %!python -m json.tool
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

noremap <F3> :Autoformat<CR><CR>
" :%!python -m json.tool
set conceallevel=0

let g:formatprg_less = "css-beautify"
let g:formatprg_html = "html-beautify"
let g:formatprg_ejs = "html-beautify"
let g:formatprg_js = "js-beautify"

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
" set background=dark
" When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

" PLUGINS:
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_checkers = ['jshint']

" paste colour -> :ColorHEX / :ColorRGB
let g:colorpicker_app = 'iTerm.app'
au BufNewFile,BufRead *.ejs set filetype=html

" Pathogen
set runtimepath+=~/Users/shambhala/Development/mighty-dotfiles/vim/autoload
execute pathogen#infect()

" TagList
" let Tlist_Compact_Format = 1
" let Tlist_GainFocus_On_ToggleOpen = 1
" let Tlist_Close_On_Select = 1
" nnoremap <C-o> :TlistToggle<CR>
"
" settings for tagbar
" nmap <F8> :TagbarToggle<CR>

" ctags
nnoremap <leader>ct :CtrlPTag<cr>

" Easymotion
let g:EasyMotion_leader_key = '<Leader>'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" NERDTree
nmap <Leader>t :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
nmap <C-CR> :NERDTreeMapOpenInTab<CR>
let NERDTreeIgnore = ['\.map$']

" Settings for ctrlp
nmap <C-o> :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules|DS_Store|git|bower_components'
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux or add a ignore file
let g:ctrlp_max_height = 30
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
set wildignore=*.o,*~,*.pyc
set wildignore+=*_build/*
set wildignore+=*/bower_components/*
set wildignore+=*/node_modules/*
set wildignore+=*/.git/*
set wildignore+=*/coverage/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=.git\*,.hg\*,.svn\*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
set wildignore+=*/client-build/*
set wildignore+=*/bin/*

" Settings for tabularize
if exists(":Tabularize")
    nmap <Leader>a= :Tab /=<CR>
    vmap <Leader>a= :Tab /=<CR>
    nmap <Leader>a/ :Tab /\/\/<CR>
    vmap <Leader>a/ :Tab /\/\/<CR>
    nmap <Leader>a: :Tab /:\zs<CR>
    vmap <Leader>a: :Tab /:\zs<CR>
    nmap <Leader>a" :Tab /"<CR>
    vmap <Leader>a" :Tab /"<CR>
endif

" settings for davidhalter/jedi-vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}

" settings for omnicomplete
" Better navigating through omnicomplete option list
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
" function! OmniPopup(action)
"     if pumvisible()
"         if a:action == 'j'
"             return "\<C-N>"
"         elseif a:action == 'k'
"             return "\<C-P>"
"         endif
"     endif
"     return a:action
" endfunction

inoremap <expr> <C-CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
" inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

" inoremap <C-Space> <C-x><C-o>
" inoremap <C-@> <C-Space>

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction

" inoremap <expr> <Nul> Auto_complete_string()
" inoremap <expr> <C-Space> Auto_complete_string()

" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" inoremap <C-space> <C-P>

" LANGUAGE SPECIFIC:
" Python:
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" 14 Aug 2015
" Load sensible after vimrc - overloading
" runtime! plugin/sensible.vim
"
" colorscheme default
"
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --group\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" autocmd filetype c nnoremap <F4> :w :normal Gi int main() {^V<esc> gg i } ^V<esc> <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" autocmd filetype c nnoremap <F4> :normal ggOint main() {<esc> Go}<esc>:w ~/test.txt<cr>
nnoremap <leader>o :tabnew<cr>:o test.c<cr>:QuickRun<cr>
nnoremap <F5> :QuickRun<cr>

