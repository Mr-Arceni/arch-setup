#!/bin/bash

sudo pacman --noconfirm -S zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

sed -i 's|plugins=(|plugins=(zsh-syntax-highlighting |' ~/.zshrc
sed -i 's|ZSH_THEME=".*"|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc
sudo sed -i 's|#Color|Color|' /etc/pacman.conf
echo "if [ -f ~/.zsh_aliases ]; then\n    . ~/.zsh_aliases\nfi" >> ~/.zshrc
echo "alias ip='ip -color=auto'" >> ~/.zsh_aliases
echo "alias ls='ls --color=auto'" >> ~/.zsh_aliases
echo "include /usr/share/nano/sh.nanorc" >> ~/.nanorc

source ~/.zshrc
