====
dotvim
====
My personal vimdot files (see the vimcast on vimcast.org for details)
----

To get it:
- delete or move out of the way your  ~/.vim directory.
- then run::
    git clone https://github.com/svenXY/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
- plugins are now maintained by vundle_:
::
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall
- or - from within vim::
    :BundleInstall

 .. _vundle: https://github.com/gmarik/vundle
