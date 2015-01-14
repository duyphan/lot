# Load the Rails application.
require File.expand_path('../application', __FILE__)

LOT_CONFIG = YAML.load_file("#{::Rails.root}/config/import.yml")

# Initialize the Rails application.
Rails.application.initialize!
