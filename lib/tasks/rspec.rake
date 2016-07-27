require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:specs) do |task|
  task.pattern = 'spec/**/*_spec.rb'
end