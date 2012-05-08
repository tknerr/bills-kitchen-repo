#
# Vagrant file for running my-chef-server and the nodes talking to it
#
Vagrant::Config.run do |config|

  # default base box
  config.vm.box = "ubuntu-11.04"
  config.vm.box_url = "W:\\boxes\\ubuntu-11.04-server-amd64-vagrant.box"	

  #
  # Runs a pre-baked Chef Server VM that you can immediately use.
  # * in <current_dir>/.chef you find a pre-configured knife.rb and client certificates
  # * the login for the webui is admin/t0ps3cr3t. 
  #
  config.vm.define :chef_server do | chef_server_config |
    
    chef_server_config.vm.box = "pre-baked-chef-server"
    chef_server_config.vm.box_url = "W:\\boxes\\chef-server-on-ubuntu-11.04-server-amd64-vagrant.box"
    
	chef_server_config.vm.customize do |vm|
      vm.memory_size = 1024
      vm.name = "Chef Server"
    end
    chef_server_config.vm.host_name = "chef-server"
    chef_server_config.vm.network :hostonly, "33.33.3.10"
    chef_server_config.vm.forward_port 22, 22310
  end
  
  #
  # brings up a Bare OS VM image that can be used for bootstrapping with knife
  #
  config.vm.define :bare_os_image do | bare_os_image_config |
    
    bare_os_image_config.vm.box = "bare-os"
    bare_os_image_config.vm.box_url = "W:\\boxes\\ubuntu-11.04-server-amd64-bare-os.box"
    
    bare_os_image_config.vm.customize do |vm|
      vm.memory_size = 1024
      vm.name = "Bare OS Image (Bootstrap Me!)"
    end
    bare_os_image_config.vm.host_name = "bare-os-image"
    bare_os_image_config.vm.network :hostonly, "33.33.3.11"
    bare_os_image_config.vm.forward_port 22, 22311
  end
end