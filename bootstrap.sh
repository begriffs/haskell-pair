#!/usr/bin/env bash

apt-get update -q
apt-get install gcc libgmp-dev alex happy curl libpq-dev libcurl4-gnutls-dev libpcre3-dev libffi-dev make python-software-properties vim ctags git tmux ruby ufw fail2ban xz-utils zsh libpq-dev postgresql -y -q

echo "-----> Installing Stack"
wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | apt-key add -
echo 'deb http://download.fpcomplete.com/ubuntu/trusty stable main'|tee /etc/apt/sources.list.d/fpco.list
apt-get update && apt-get install stack -y

echo "-----> Setting up GHC"
stack setup

echo "-----> Saving system tmux.conf"
cp /vagrant/config/tmux.conf /etc

if hash wemux 2>/dev/null; then
  echo "-----> Wemux detected"
else
  echo "-----> Installing wemux"
  git clone git://github.com/zolrath/wemux.git /usr/local/share/wemux
  ln -s /usr/local/share/wemux/wemux /usr/local/bin/wemux
  cp /vagrant/config/wemux.conf /usr/local/etc
fi

if hash gh-auth 2>/dev/null; then
  echo "-----> github-auth detected"
else
  echo "-----> Installing Github key-based auth"
  gem install github-auth
fi

echo "-----> Adding pairing scripts"
mkdir -p $HOME/bin
cp /vagrant/user-scripts/* $HOME/bin

echo "-----> Creating user 'friend'"
adduser friend
echo "wemux pair; exit" > /home/friend/.bash_profile

echo "-----> Firewalling everything except SSH"
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

echo "-----> Hardening OpenSSH"
cp /vagrant/config/sshd_config /etc/ssh/sshd_config

echo "-----> Installing Heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
