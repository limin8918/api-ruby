ENV['RACK_ENV'] = 'test'
require 'support/simple_cov'

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

require 'stencil'
lib_dir = File.join(File.dirname(__FILE__), '..', 'lib','stencil')

Dir.glob("#{lib_dir}/**/*.rb") do |path|
  if FileTest.file? path
    require path
  end
end

