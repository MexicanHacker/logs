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

  config.vm.forward_port 80, 4545
  config.vm.forward_port 5432, 5434
  config.vm.forward_port 3000, 3030
  config.vm.forward_port 4000, 4040
  config.vm.forward_port 9090, 9009
  config.vm.forward_port 9200, 9220
  config.vm.forward_port 9292, 9292
	
  # You can have Vagrant automatically mount folders.
  # Here we're mounting this directory to ./codeshare on the VM
  # This is where we will pull the demandware git repo
  config.vm.share_folder "converse", "/home/vagrant/converse", "./converse"

end
