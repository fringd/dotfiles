#!/bin/bash
cd $HOME/dotfiles
for file in *; do
  if [ "$file" != "config" ]; then
    dest="$HOME/.$file"
    if  [ -f  $dest ] || [ -d $dest ]; then
      mv "$dest" "$dest.bak"
    fi

    if [ -L "$dest" ]; then
      rm "$dest"
    fi

    ln -s dotfiles/$file "$dest"
  fi
done

cd config
for file in *; do
  dest="$HOME/.config/$file"
  if  [ -f  $dest ] || [ -d $dest ]; then
    mv "$dest" "$dest.bak"
  fi

  if [ -L "$dest" ]; then
    rm "$dest"
  fi

  ln -s ../dotfiles/config/$file "$dest"
done

