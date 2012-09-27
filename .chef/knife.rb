#
# pre-configured knife.rb for my-chef-server
#
current_dir = File.dirname(__FILE__)
log_level                :debug
log_location             STDOUT
node_name                "cheffe"
chef_server_url          "https://33.33.3.10"
client_key               "#{current_dir}/cheffe.pem"
validation_client_name   "chef-validator"
validation_key           "#{current_dir}/validation.pem"
cookbook_path            ["#{current_dir}/../cookbooks"]
cache_type               "BasicFile"
cache_options( :path => "W:/home/.chef/checksums" )


