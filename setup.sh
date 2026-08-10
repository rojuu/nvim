#!/usr/bin/env bash

pushd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
make -j12
popd

pushd ~/.local/share/nvim/site/pack/core/opt/LuaSnip
make install_jsregexp
popd

