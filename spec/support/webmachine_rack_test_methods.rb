require 'rack/test'
require 'webmachine'
require 'webmachine/adapters/rack'

module WebmachineRackTestMethods

  include Rack::Test::Methods

  def webmachine_test_rack_app resource, route = '*'
    Webmachine::Application.new do |app|
      app.add_route([route], resource )
      app.configure do | config |
        config.adapter = :Rack
      end
    end.adapter

  end
end
