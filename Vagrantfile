Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "provision.sh"
  config.vm.network :forwarded_port, host: 9200, guest: 9200
  config.vm.network :forwarded_port, host: 27017, guest: 27017
  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 1
    v.name = "ubuntu-elastic-mongo"
  end
end
