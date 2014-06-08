echo "-----> Using Sixarm git config"
git clone https://github.com/SixArm/sixarm_git_gitconfig.git /tmp/sixarm-gitconfig
mkdir -p $HOME/.gitconfig.d
cp /tmp/sixarm-gitconfig/gitconfig.d/* $HOME/.gitconfig.d
cp /vagrant/config/gitconfig $HOME/.gitconfig
