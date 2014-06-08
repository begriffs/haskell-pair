if [ ! -e $HOME/.haskell-vim-now/bin ]; then
  echo "-----> Retrieving prebuilt ghc-mod etc"
  git clone https://github.com/begriffs/haskell-vim-now.git $HOME/.haskell-vim-now
  mkdir -p $HOME/.haskell-vim-now/bin
  HELPER_BIN_URL="https://s3-us-west-1.amazonaws.com/haskell-pair/haskell-vim-now-bin.tar.xz"
  curl --silent -L "$HELPER_BIN_URL" | unxz | tar x -C $HOME/.haskell-vim-now/bin
fi

echo "-----> Installing/updating haskell-vim-now"
curl -o - https://raw.githubusercontent.com/begriffs/haskell-vim-now/master/install.sh | bash
