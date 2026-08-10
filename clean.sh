#!/usr/bin/env bash


read -p "Remove ~/.local/share/nvim? [y/N] " yn
case $yn in
  [Yy]* ) rm -rf ~/.local/share/nvim;;
esac

read -p "Remove ~/.local/state/nvim? [y/N] " yn
case $yn in
  [Yy]* ) rm -rf ~/.local/state/nvim;;
esac


