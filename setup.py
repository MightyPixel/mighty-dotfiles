
from os.path import expanduser, dirname, abspath
from subprocess import call


home = expanduser("~")
dotfolder = dirname(abspath(__file__))

call(["ln", "-s", dotfolder + "/.vim", home + "/.vim"])
call(["ln", "-s", dotfolder + "/.vimrc", home + "/.vimrc"])
# call(["ln", "-s", ".bashrc", "~/.bashrc"])
