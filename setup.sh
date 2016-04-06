# PythonGen

pushd `dirname $0` > /dev/null                  # dotfiles directory
dir=`pwd -P`
popd > /dev/null

bash $dir/sync.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
   curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ~/.vim/colors/tmp; \
    git clone git@github.com:nanotech/jellybeans.vim.git ~/.vim/colors/tmp; \
    mv ~/.vim/colors/tmp/colors/jellybeans.vim ~/.vim/colors/; \
    rm -rf ~/.vim/colors/tmp;

curl -o ~/.vim/colors/wombat256.vim 'http://www.vim.org/scripts/download_script.php?src_id=13400'
curl -o ~/.vim/colors/wombat256mod.vim 'https://raw.githubusercontent.com/newzealandpaul/wombat256mod/master/colors/wombat256mod.vim'

# Install native dependencies
# TODO: check package manager
# SUDO
sudo npm install -g vimdebug
brew install ack
brew install the_silver_searcher
brew install ctags-exuberant

cd ~/.vim/bundle

git clone git@github.com:wesQ3/vim-windowswap.git

# 14 Aug 2015
# Base
# baseline config
git clone git://github.com/tpope/vim-sensible.git
# Comments
git clone git://github.com/tpope/vim-commentary.git
# ctrl a and stuff ?
git clone git://github.com/tpope/vim-rsi.git

# Add conterpart if endif etc
git clone git://github.com/tpope/vim-endwise

# Should detect tabs/spaces?
git clone git://github.com/tpope/vim-sleuth.git
git clone https://github.com/tpope/vim-repeat.git

git clone https://github.com/vim-scripts/marvim.git

# easy tags
git clone https://github.com/xolox/vim-misc.git
# auto-create ctags
git clone https://github.com/xolox/vim-easytags.git

# join lines
https://github.com/AndrewRadev/splitjoin.vim.git

# Ruby + Rails env
#
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git

git clone git://github.com/skalnik/vim-vroom.git

# JS
https://github.com/mklabs/vim-backbone

# Before 14 Aug 2015

git clone git@github.com:nvie/vim-togglemouse.git
git clone git@github.com:vim-scripts/YankRing.vim.git
git clone git://github.com/tpope/vim-repeat.git
# File Management
git clone git@github.com:kien/ctrlp.vim.git
git clone git@github.com:mileszs/ack.vim.git
git clone git@github.com:rking/ag.vim.git
git clone git@github.com:scrooloose/nerdtree.git

git clone git@github.com:Lokaltog/powerline.git
git clone git://github.com/vim-airline/vim-airline-themes
git clone git@github.com:tomtom/tlib_vim.git
git clone git://github.com/MarcWeber/vim-addon-mw-utils.git
git clone git@github.com:tpope/vim-fugitive.git

git clone git://github.com/garbas/vim-snipmate.git
git clone git://github.com/honza/vim-snippets.git
git clone git://github.com/nathanaelkane/vim-indent-guides.git
git clone git@github.com:terryma/vim-multiple-cursors.git
git clone git://github.com/tpope/vim-abolish.git

git clone git@github.com:Lokaltog/vim-easymotion.git

git clone git@github.com:davidhalter/jedi-vim.git
cd jedi-vim/
git submodule update --init
cd ~/.vim/bundle

mkdir -p ~/.vim/ftplugin
curl -o ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492

git clone git://github.com/dbakker/vim-lint.git
git clone git://github.com/scrooloose/syntastic.git

npm install -g js-beautify
git clone git@github.com:Chiel92/vim-autoformat.git
git clone git@github.com:Yggdroot/indentLine.git
git clone git://github.com/godlygeek/tabular.git
git clone git://github.com/nathanaelkane/vim-indent-guides.git
git clone git@github.com:nvie/vim-flake8.git
git clone git@github.com:airblade/vim-gitgutter.git
git clone git://github.com/burnettk/vim-angular.git
vim +Helptags +q


git clone git://github.com/tpope/vim-fireplace.git
git clone git://github.com/tpope/vim-classpath.git
git clone git://github.com/guns/vim-clojure-static.git
git clone git://github.com/tpope/vim-sexp-mappings-for-regular-people.git
git clone git://github.com/guns/vim-sexp.git
git clone git://github.com/tpope/vim-repeat.git
git clone git://github.com/tpope/vim-surround.git

git clone git://github.com/rizzatti/dash.vim.git

# WEB
git clone git@github.com:marijnh/tern_for_vim.git
git clone git://github.com/tpope/vim-surround.git
git clone git@github.com:rstacruz/sparkup.git
git clone git://github.com/lilydjwg/colorizer.git
git clone git://github.com/iandoe/vim-osx-colorpicker.git # dev mode for colour picker -> http://download.panic.com/picker/

# NODE JS git://github.com/joyent/node/wiki/Vim-Plugins
git clone git://github.com/moll/vim-node.git ~/.vim/bundle/node
git clone git@github.com:ahayman/vim-nodejs-complete.git

# TYPESCRIPT
git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/.vim/bundle/vimproc.vim
make
git clone https://github.com/Quramy/tsuquyomi.git ~/.vim/bundle/tsuquyomi

cd ~/.vim/bundle/tern_for_vim; npm install
npm install -g git://github.com/ramitos/jsctags.git
