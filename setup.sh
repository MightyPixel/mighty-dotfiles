# PythonGen

pushd `dirname $0` > /dev/null                  # dotfiles directory
dir=`pwd -P`
popd > /dev/null

source $dir/sync.sh

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

cd ~/.vim/bundle

# 14 Aug 2015
# Base
git clone git://github.com/tpope/vim-sensible.git


# Before 14 Aug 2015

git clone git@github.com:nvie/vim-togglemouse.git
git clone git@github.com:vim-scripts/YankRing.vim.git
git clone git://github.com/tpope/vim-repeat.git
# File Management
git clone git@github.com:kien/ctrlp.vim.git
git clone git@github.com:mileszs/ack.vim.git
git clone git@github.com:scrooloose/nerdtree.git

git clone git@github.com:Lokaltog/powerline.git
git clone https://github.com/bling/vim-airline
git clone git@github.com:tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone git@github.com:tpope/vim-fugitive.git

git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
git clone git://github.com/nathanaelkane/vim-indent-guides.git
git clone git@github.com:terryma/vim-multiple-cursors.git
git clone git://github.com/tpope/vim-abolish.git

git clone git@github.com:Lokaltog/vim-easymotion.git
git clone https://github.com/scrooloose/nerdcommenter.git

git clone git@github.com:davidhalter/jedi-vim.git
cd jedi-vim/
git submodule update --init
cd ~/.vim/bundle

mkdir -p ~/.vim/ftplugin
curl -o ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492

git clone https://github.com/dbakker/vim-lint.git
git clone https://github.com/scrooloose/syntastic.git

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

git clone https://github.com/rizzatti/dash.vim.git

# WEB
git clone git@github.com:marijnh/tern_for_vim.git
git clone git://github.com/tpope/vim-surround.git
git clone git@github.com:rstacruz/sparkup.git
git clone https://github.com/lilydjwg/colorizer.git
git clone https://github.com/iandoe/vim-osx-colorpicker.git # dev mode for colour picker -> http://download.panic.com/picker/

# NODE JS https://github.com/joyent/node/wiki/Vim-Plugins
git clone https://github.com/moll/vim-node.git ~/.vim/bundle/node
git clone git@github.com:ahayman/vim-nodejs-complete.git

cd ~/.vim/bundle/tern_for_vim; npm install
npm install -g git://github.com/ramitos/jsctags.git
