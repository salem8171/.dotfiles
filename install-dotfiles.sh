#!/bin/bash

cd `dirname $0`
prefix=`pwd`

find $prefix -type f |
  while read source; do 
    destination=`echo $source | sed "s#$prefix#$HOME#"`
    echo $source " -> " $destination
    mkdir -p `dirname $destination`
    ln -f $source $destination
  done

rm $HOME/$BASH_SOURCE
