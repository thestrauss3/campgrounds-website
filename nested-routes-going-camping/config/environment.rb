# Load the Rails application.
require_relative 'application'

app_environment_variable = File.join(Rails.root, 'config', 'app_environment_variable.rb')
load(app_environment_variable) if File.exists?(app_environment_variable)

# Initialize the Rails application.
Rails.application.initialize!
