<p align="center">
  <a href="http://youtu.be/7sr8cAIwdBs"><img src="screencast.png" /></a>
</p>

## Installation

### on a local virtualbox

1. Clone this repo
1. Install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/)
1. `vagrant up`
1. `vagrant ssh`

This will create a clean dev environment with the newest GHC and
Cabal.  It also includes
[haskell-vim-now](https://github.com/begriffs/haskell-vim-now), a
vim configured to be a Haskell IDE.

### on a public pair programming server

1. Clone this repo
1. Install [Vagrant](http://www.vagrantup.com/)
1. Sign up at [DigitalOcean](https://www.digitalocean.com/)
1. Fill out your DigitalOcean client ID and API key in `Vagrantfile`
1. `vagrant up --provider=digital_ocean`
1. `vagran ssh`

You'll be logged in to a newly created DigitalOcean "droplet."

## Included software

1. Ubuntu 14.04
1. GHC 7.8.2, Cabal 1.20
1. [haskell-vim-now](https://github.com/begriffs/haskell-vim-now)
1. [SixArm git config](https://github.com/SixArm/sixarm_git_gitconfig)
1. Firewall, hardened OpenSSH, Fail2ban
1. Oh My ZSH, Tmux/wemux

## Pairing

To pair program with someone you can give them login access by
running

```sh
pair github_name
```

They connect to your server by `ssh-add`'ing their Github SSH key
and running `ssh friend@[your-server-ip]`.

When you're done working with them, run

```sh
unpair
```
