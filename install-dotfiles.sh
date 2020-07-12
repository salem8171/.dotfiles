#!/bin/bash

cd $(dirname $0)
prefix=$(pwd)

find $prefix -type f |
  grep -v ".git/" |
  grep -v ".git$" |
  grep -v "$prefix/install-dotfiles.sh" |
  grep -v "$prefix/post-install.sh" |
  grep -v "$prefix/root-pre-install.sh" |
  grep -v "$prefix/install-dependancies.sh" |
  grep -v "$prefix/dependancies.txt" |
  while read source; do
    destination=$(echo $source | sed "s#$prefix#$HOME#")
    mkdir -p $(dirname $destination)
    ln -f $source $destination && echo $source " -> " $destination
  done

# rm $HOME/$BASH_SOURCE
