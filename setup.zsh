#! /usr/bin/env zsh

sudo chsh -s $(which zsh) cnk

# go install coreutils if this line fails on OSX
dotdir=$(readlink -f $(pwd))
backupdir=dotfiles.$(date +%s).backup

function dotrelink () {
  if [[ -a $2 ]]; then
    mv -v $2 $backupdir;
  fi
  ln -svf $dotdir/$1 $2
}

(
  cd $HOME
  mkdir $backupdir

  mkdir -p .vim/swap/
  mkdir -p .vim/undo/

  dotrelink zshrc .zshrc
  dotrelink vimrc .vimrc
  dotrelink pythonrc .pythonrc
  dotrelink screenrc .screenrc
  dotrelink gitconfig .gitconfig
  dotrelink tmuxrc .tmux.conf
  dotrelink inputrc .inputrc
  mkdir -p .aliases

  mkdir -p script
  dotrelink script/uniq.py script/uniq.py

  mkdir -p .vim/autoload
  mkdir -p .vim/bundle
  dotrelink vim-pathogen/autoload/pathogen.vim .vim/autoload/pathogen.vim

  dotrelink vim-plugins/vim-fugitive .vim/bundle/vim-fugitive
  dotrelink vim-plugins/vim-surround .vim/bundle/vim-surround
  dotrelink vim-plugins/vim-commentary .vim/bundle/vim-commentary
  dotrelink vim-plugins/vim-unimpaired .vim/bundle/vim-unimpaired

  dotrelink aliases/essentials .aliases/essentials
  dotrelink aliases/auto .aliases/auto

  source .zshrc
)
