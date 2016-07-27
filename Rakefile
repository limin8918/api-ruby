# encoding: utf-8
fail "This script shouldn't be run as root user ◴_◶" if Process.euid == 0

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

$LOAD_PATH << File.expand_path('lib', File.dirname(__FILE__))

# Gems in development/test won't be loaded by Bundler in production, make sure we don't try to load a task that doesn't exist
if ENV['RACK_ENV'] != 'production'

  ENV['COVERAGE']='true'

  task :default => [:specs]

  FileList['./lib/tasks/**/*.rake'].each { |task| load task }
end
