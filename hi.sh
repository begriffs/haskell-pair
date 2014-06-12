echo "-----> Installing fujimura/hi"
git clone https://github.com/fujimura/hi.git /tmp/hi
cd /tmp/hi
cabal sandbox init
cabal install -j --disable-documentation --bindir=$HOME/bin
