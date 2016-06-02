Vagrant.configure(2) do |config|
        config.vm.box = "ubuntu/trusty64"
 
        config.vm.provider "virtualbox" do |v|
                v.cpus = 1
                v.memory = 512
        end

        config.vm.provision :shell, :path => "bootstrap.sh"

end
