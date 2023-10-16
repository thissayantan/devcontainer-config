#!/usr/bin/env zsh

# Update system and install prerequisites
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

# Install pyenv
curl https://pyenv.run | bash

# Add pyenv to bash so that it runs every time your session starts
echo ' ' >> ~/.zshrc
echo '# pyenv' >> ~/.zshrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

# Reload shell to apply changes
source ~/.zshrc

# Install the latest version of Python
latest_python_version=$(pyenv install --list | grep -v '[a-z]' | grep -v 'dev' | tail -1 | tr -d '[:space:]')
pyenv install $latest_python_version
pyenv global $latest_python_version

# Install Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# Copy your custom Oh-My-Posh theme\
mkdir -p ~/.oh-my-posh/themes
cp ./.devcontainer/config/minimal.json ~/.oh-my-posh/themes/

# Configure Oh-My-Posh to use your custom theme
echo ' ' >> ~/.zshrc
echo '# oh-my-posh config' >> ~/.zshrc
echo 'eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/themes/minimal.json)"' >> ~/.zshrc

# Reload shell to apply changes
source ~/.zshrc

echo "Setup completed successfully!"
