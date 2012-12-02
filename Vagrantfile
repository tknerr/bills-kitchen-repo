#
# Vagrant file for running my-chef-server and the nodes talking to it
#
Vagrant::Config.run do |config|

  # default base box
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box"

  #
  # Vagrant VM for the Chef Server. Once the Vagrant VM is up, 
  # use `knife-server` to bootstrap the chef server:
  # `knife server bootstrap standalone --ssh-user vagrant \ 
  #   --ssh-password vagrant --node-name chef-server \ 
  #   --host 33.33.3.10 --bootstrap-version 10.14.4.rc.0`
  # 
  # * in <current_dir>/.chef you find a pre-configured knife.rb
  # * knife-server will create `cheffe.pem` and `validation.pem` in <current_dir>/.chef
  # * the REST API is available at https://33.33.3.10 (and http://33.33.3.10:4000)
  # * the Webui is available at http://33.33.3.10:4040, login is admin/chefchef 
  #
  config.vm.define :chef_server do | chef_server_config |
    
    chef_server_config.vm.box = "ubuntu-12.04-server-amd64-bare-os"
    chef_server_config.vm.box_url = "http://dl.dropbox.com/u/13494216/ubuntu-12.04-server-amd64-bare-os.box"
    
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