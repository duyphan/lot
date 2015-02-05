current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "duyphan"
client_key               "#{current_dir}/duyphan.pem"
validation_client_name   "#{current_dir}/dpchef123-validator"
validation_key           "#{current_dir}/dpchef123-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/dpchef123"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
# cookbook_path            ["#{current_dir}/../cookbooks"]
 
cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
encrypted_data_bag_secret "#{current_dir}/encrypted_data_bag_secret"