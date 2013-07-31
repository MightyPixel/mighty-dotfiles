
from os.path import expanduser, dirname, abspath
from subprocess import call


home = expanduser("~")
vim_root = home + '/.vim'
dotfolder = dirname(abspath(__file__))

call(["ln", "-s", dotfolder + "/.vim", vim_root])

# vundle_git_url = 'https://github.com/gmarik/vundle.git'
# vundle_root = vim_root + '/bundle/vundle'
# call(['git', 'clone', vundle_git_url, vundle_root])

call(["ln", "-s", dotfolder + "/.vimrc", home + "/.vimrc"])
# call(["ln", "-s", ".bashrc", "~/.bashrc"])
