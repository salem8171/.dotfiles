#!/bin/bash

nvim -c "PlugInstall" -c "qa"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
