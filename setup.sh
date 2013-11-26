# PythonGen

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

mkdir -p ~/.vim/colors; \
    git clone git@github.com:nanotech/jellybeans.vim.git ~/.vim/colors/; \
    mv ~/.vim/colors/colors/jellybeans.vim ~/.vim/colors/; \
    rm -r ~/.vim/colors/colors;

cd ~/.vim/bundle
git clone git@github.com:kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone git@github.com:Lokaltog/powerline.git
# snipmate
git clone git@github.com:tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git

git clone https://github.com/bling/vim-airline
git clone git@github.com:Lokaltog/vim-easymotion.git
git clone git@github.com:tpope/vim-fugitive.git

#jedi-vim
git clone git@github.com:davidhalter/jedi-vim.git
cd jedi-vim/
git submodule update --init
cd ~/.vim/bundle

git clone git@github.com:scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone git@github.com:Chiel92/vim-autoformat.git
git clone git@github.com:nvie/vim-flake8.git
git clone git@github.com:airblade/vim-gitgutter.git
