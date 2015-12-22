#!/usr/bin/env bash

install() {
	stow stow # need to run this first so that README.md files are ignored.
	for d in */; do
		echo "Creating symlinks for $d";
		stow $d
	done
}

uninstall() {
	for d in */; do
		echo "Removing symlinks for $d";
		stow --delete $d
	done
}

case "$1" in
	install)
		install
		;;
	uninstall)
		uninstall
		;;
	*)
		echo $"Usage: $0 {install|uninstall}"
		exit 1
esac

