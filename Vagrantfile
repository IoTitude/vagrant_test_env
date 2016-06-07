# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.ssh.private_key_path = '/var/lib/jenkins/.ssh/id_rsa_jenkins'
  config.vm.box = 'digital_ocean'


  config.vm.provider :digital_ocean do |provider, override|
    config.ssh.forward_agent = true
    config.vm.hostname = 'vagrantdroplet'
    override.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    provider.token = 'digitaloceanprovidertoken'
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'AMS2'
    provider.size = '1gb'
    # provider.ca_path = "/etc/ssl/certs/ca-certificates.crt"
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

end
