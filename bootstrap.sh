#!/usr/bin/env bash

apt-get update
apt-get install gcc libgmp-dev alex happy curl libcurl4-gnutls-dev make python-software-properties vim ctags git -y

GHC_VER=7.8.2
CABAL_VER=1.20.0.2

if hash ghc 2>/dev/null; then
  echo "-----> GHC detected"
else
  GHC_URL="http://www.haskell.org/ghc/dist/$GHC_VER/ghc-$GHC_VER-x86_64-unknown-linux-deb7.tar.bz2"
  echo "-----> Downloading GHC $GHC_VER"
  curl --silent -L "$GHC_URL" | bunzip2 | tar x -C /tmp
  cd /tmp/ghc-$GHC_VER
  echo "-----> Installing GHC $GHC_VER"
  ./configure
  make install
fi

if hash cabal 2>/dev/null; then
  echo "-----> Cabal detected"
else
  CABAL_URL="http://www.haskell.org/cabal/release/cabal-install-$CABAL_VER/cabal-install-$CABAL_VER.tar.gz"
  echo "-----> Downloading cabal-install $CABAL_VER"
  curl --silent -L "$CABAL_URL" | tar zx -C /tmp
  cd /tmp/cabal-install-$CABAL_VER
  echo "-----> Installing cabal-install $CABAL_VER"
  ./bootstrap.sh --global
fi
