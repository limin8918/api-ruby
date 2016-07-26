if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    minimum_coverage 100
  end
end