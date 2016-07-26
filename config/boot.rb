
# Avoid modifying boot.rb for easier stencil upgrading - modify stencil.rb instead

$LOAD_PATH << File.expand_path('../../lib', __FILE__)

# Default environment
# Try to avoid using RACK_ENV as a switch unless absolutely necessary.
# Use environment variables instead.
ENV['RACK_ENV'] ||= 'development'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
if File.exists?(ENV['BUNDLE_GEMFILE'])
  require 'bundler/setup'
  Bundler.require
end

if ENV['RACK_ENV'] == 'production'
  require 'stencil/environment_variables'
  Stencil::EnvironmentVariables.check
  # Initialise NewRelic
end


# Load Stencil
require 'stencil'