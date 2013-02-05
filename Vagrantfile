# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "jba"
  

  config.vm.network :hostonly, '172.27.27.110'
  config.vm.share_folder "jba", "/var/www/apps/jba/", ".", :nfs => true

  config.vm.host_name = "rails.vm"
end
