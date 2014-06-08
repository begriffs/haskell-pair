echo "-----> Switching to oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

echo "-----> Customizing .zshrc"
cp /vagrant/.zshrc $HOME
chsh -s /bin/zsh
