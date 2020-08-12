#!/bin/bash
set -o errexit

if [ ! $(which git) ]; then
  echo "Installing git"
  xcode-select --install
fi

if [ ! $(which brew) ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew update
brew upgrade || true
brew cask list
brew bundle install --file=- <<-EOF
brew "tmux"
brew "fish"
brew "vim"
EOF

if [ ! -e /Applications/iTerm.app ]; then
  echo "Installing iTerm2..."
  brew cask install iterm2
fi

brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

sudo dscl . -create /Users/$USER UserShell /usr/local/bin/fish

mkdir -p ~/.config/fish

# True color tmux configuration
mkdir -p ~/.tmux
if [ ! -e ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s "$SCRIPTPATH"/config/fish/config.fish ~/.config/fish/config.fish || true
mkdir -p ~/.config/fish/functions
ln -s "$SCRIPTPATH"/config/fish/functions/* ~/.config/fish/functions/ || true
ln -s "$SCRIPTPATH"/config/fish/fishfile ~/.config/fish/fishfile || true
ln -s "$SCRIPTPATH"/tmux.conf ~/.tmux.conf || true

VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
if [ ! -d "$VUNDLE_DIR" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_DIR
fi

bash < <(curl -Ls https://github.com/jshep3000/vim-jsheppard/raw/master/scripts/setup.sh)

