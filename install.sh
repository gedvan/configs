#!/bin/bash

context="$(dirname "$(readlink -f "$0")")"
cd "$context"

for subtree in ".vim/bundle/neobundle.vim https://github.com/Shougo/neobundle.vim master"
do
  git subtree pull --prefix $subtree --squash || git subtree add --prefix $subtree --squash
done

cd -

rsync -av \
  --exclude '.git/' \
  --exclude '.gitignore' \
  --exclude '*.swp' \
  --exclude 'install.sh' \
  --exclude 'README.md' \
  "$context/" ~/

vim +NeoBundleInstall +qall

if [ "$(find ~/.vim/bundle/YouCompleteMe -name 'ycm_client_support.so')" == "" ]
then
  cd ~/.vim/bundle/YouCompleteMe && ./install.sh && cd -
fi

