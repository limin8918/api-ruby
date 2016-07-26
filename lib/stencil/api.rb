require 'webmachine'
require 'webmachine/adapters/rack'
require 'stencil/api/resources/index'

module Stencil
  API ||= begin
    api = Webmachine::Application.new do | app |
      app.routes do
        add(['index', '*'], Api::Resources::Index)
      end
    end

    api.configure do | config |
      config.adapter = :Rack
    end

    api.adapter
  end
end

