# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.network "forwarded_port", guest: 21, host: 8021
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision "shell", path: "setup.sh"
	
  config.vm.provider "virtualbox" do |vb|
     vb.customize ["modifyvm", :id, "--memory", "6144"]
	 vb.customize ["modifyvm", :id, "--cpus", "4"]   
     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
     vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]            
     vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end	
  
end
