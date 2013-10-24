# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "base"
  config.vm.box = "minimal-centos-62"
  config.vm.box_url = "http://storage.tacitknowledge.com/tk-storage/common/public/software/vagrant_boxes/centos-6.2-x86_64-netinstall-4.1.14.box"

  # VM customizations. You can find a complete list of parameters by running 'VBoxManage modifyvm'.
  config.vm.customize [
    "modifyvm", :id,
    "--name", "tacit_logger",
    "--memory", "1024",
    "--cpus", "4"
  ]

  config.vm.forward_port 80, 8080
  config.vm.forward_port 9200, 9200
	
  config.vm.share_folder "codeshare", "/home/vagrant/codeshare", "./codeshare"

  config.vm.provision :chef_solo do |chef|
    # We're going to download our cookbooks from the web
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.add_role "base"
  end

end