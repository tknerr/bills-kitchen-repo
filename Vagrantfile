#
# Vagrant file for running my-chef-server and the nodes talking to it
#
Vagrant::Config.run do |config|

  # default base box
  config.vm.box = "ubuntu-12.04-server-amd64-vagrant"
  config.vm.box_url = "http://dl.dropbox.com/u/13494216/ubuntu-12.04-server-amd64-vagrant.box"

  #
  # Runs a pre-baked Chef Server VM that you can immediately use.
  # * in <current_dir>/.chef you find a pre-configured knife.rb and client certificates
  # * the login for the webui is admin/t0ps3cr3t. 
  #
  config.vm.define :chef_server do | chef_server_config |
    
    chef_server_config.vm.box = "chef-server-on-ubuntu-12.04-server-amd64-vagrant"
    chef_server_config.vm.box_url = "http://dl.dropbox.com/u/13494216/chef-server-on-ubuntu-12.04-server-amd64-vagrant.box"
    
    chef_server_config.vm.customize ["modifyvm", :id, "--memory", "2048"]
    chef_server_config.vm.customize ["modifyvm", :id, "--cpus", "2"]
    chef_server_config.vm.customize ["modifyvm", :id, "--name", "Chef Server"] 

    chef_server_config.vm.host_name = "chef-server"
    chef_server_config.vm.network :hostonly, "33.33.3.10"
    chef_server_config.vm.forward_port 22, 22310 
  end
  
  #
  # brings up a Bare OS VM image that can be used for bootstrapping with knife
  #
  config.vm.define :bare_os_image do | bare_os_image_config |
    
    bare_os_image_config.vm.box = "ubuntu-12.04-server-amd64-bare-os"
    bare_os_image_config.vm.box_url = "http://dl.dropbox.com/u/13494216/ubuntu-12.04-server-amd64-bare-os.box"
        
    bare_os_image_config.vm.customize ["modifyvm", :id, "--memory", "512"]
    bare_os_image_config.vm.customize ["modifyvm", :id, "--name", "Bare OS Image (Bootstrap Me!)"] 

    bare_os_image_config.vm.host_name = "bare-os-image"
    bare_os_image_config.vm.network :hostonly, "33.33.3.11"
    bare_os_image_config.vm.forward_port 22, 22311
  end
end