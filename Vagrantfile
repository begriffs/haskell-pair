# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "vim.sh", :privileged => false
  config.vm.network :forwarded_port, host: 4567, guest: 80

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/pair'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.region = 'San Francisco 1'
    provider.size = '2GB'
    provider.client_id = ''
    provider.api_key = ''
  end
end