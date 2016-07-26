ENV['RACK_ENV'] = 'test'
require 'support/simple_cov' # At the top because simplecov needs to watch files being loaded

# Adding files to /spec/support rather than customising
# spec_helper will assist in detecting diffs due to stencil upgrades.
Dir[('./spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do | config |
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.order = :random
  Kernel.srand config.seed

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

