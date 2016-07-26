require 'webmachine'
require 'json'
require 'stencil/api/json_error_handler'
require 'stencil/api/resource_methods'

module Stencil
  module Api
    module Resources
      class Index < Webmachine::Resource

        include Logging
        include JsonErrorHandler
        include ResourceMethods

        def content_types_provided
          [["application/hal+json",  :to_json]]
        end

        def allowed_methods
          ['GET']
        end

        def to_json
          {
            id: 10001,
            name: "10001"
          }.to_json
        end

      end
    end
  end
end
