#!/bin/sh

DEVSETUP="~/linux_devsetup"

symlink_devsetup () {
    if [ [ -f ~/$1 || [ -d ~/$1 ] ]; then
	mv ~/$1 ~/$1_backup
    else if [ -h ~/$1 ]; then
	echo "ERROR: ~/$1 is already a symlink!"
	exit 1
    else
	echo "ERROR: ~/$1 is not a file or directory!"
	exit 1
    fi

    if [ ! -e $1 ]; then
	ln -s $DEVSETUP/$1 ~/$1
    fi
}

symlink_devsetup test
exit 0

symlink_devsetup .emacs
symlink_devsetup .emacs.d

echo "source $DEVSETUP/.bash_profile >> ~/.bash_profile"
echo "source $DEVSETUP/.bash_rc >> ~/.bash_rc"
echo "source $DEVSETUP/.bash_aliases >> ~/.bash_aliases"