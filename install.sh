#!/bin/bash

# Define dotfiles directory and ensure it exists
dotfiles="$HOME/.dotfiles"
if [[ ! -n "$dotfiles" ]]
then
  echo "Could not find ${dotfiles}!" >&2
  exit 1
fi

# Prompt user to select modules to link
echo " +|| Please select the modules you wish to install."
echo " +|| e) essentials   x) X (OpenBox)  m) mpd  a) apps-extra"

# Read input and parse selections
read input
input=$( echo $input | tr "[ ;,]" "\n")

for module in $input; do
  
  case $module in
    e)  echo "Installing: bash, bin, git, vim, ssh..."
        
        # Install binaries.
        mkdir -pv "$HOME/bin"
        ln -insv $dotfiles/bin/* $HOME/bin
        for f in $HOME/bin/*; do file $f | grep "broken"; done
        
        # Install ssh.
        mkdir -pv "$HOME/.ssh"
        ln -insv "$dotfiles/ssh/config"             "$HOME/.ssh/config"
        for f in $HOME/.ssh/*; do file $f | grep "broken"; done

        # Install bash, git, vim.
        ln -insv "$dotfiles/bash/bashrc"            "$HOME/.bashrc"
        ln -insv "$dotfiles/git/gitconfig"          "$HOME/.gitconfig"
        ln -insv "$dotfiles/vim/vimrc"              "$HOME/.vimrc"
        for f in $HOME/.*; do file $f | grep "broken"; done
        ;;

    x)  echo "Installing: conky, openbox, tint2, user-dirs.dirs, themes, X..."
        
        # Install conky, openbox, tint2, user-dirs.dirs.
        mkdir -pv "$HOME/.config"
        ln -insv "$dotfiles/config/conky"           "$HOME/.config/conky"
        ln -insv "$dotfiles/config/openbox"         "$HOME/.config/openbox"
        ln -insv "$dotfiles/config/tint2"           "$HOME/.config/tint2"
        ln -insv "$dotfiles/config/user-dirs.dirs"  "$HOME/.config/user-dirs.dirs"
        for f in $HOME/.config/*; do file $f | grep "broken"; done

        # Install themes, X.
        ln -insv "$dotfiles/themes"                 "$HOME/.themes"
        ln -insv "$dotfiles/X/xinitrc"              "$HOME/.xinitrc"
        ln -insv "$dotfiles/X/Xresources"           "$HOME/.Xresources"
        for f in $HOME/.*; do file $f | grep "broken"; done
        ;;

    m)  echo "Installing: ncmpcpp, mpd..."
        
        # Install ncmpcpp, mpd
        ln -insv "$dotfiles/ncmpcpp"                "$HOME/.ncmpcpp"
        ln -insv "$dotfiles/mpd/mpdconf"            "$HOME/.mpdconf"
        for f in $HOME/.*; do file $f | grep "broken"; done
        ;;

    a)  echo "Installing: geany, transmission, zathura..."
        
        # Install geany, transmission, zathura
        mkdir -pv "$HOME/.config"
        ln -insv "$dotfiles/config/geany"           "$HOME/.config/geany"
        ln -insv "$dotfiles/config/transmission"    "$HOME/.config/transmission"
        ln -insv "$dotfiles/config/zathura"         "$HOME/.config/zathura"
        for f in $HOME/.config/*; do file $f | grep "broken"; done
        ;;

    *)  echo "Malformed input: "$module
        ;;
  esac
  
done

