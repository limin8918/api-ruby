require 'webmachine'
require 'json'
require_relative '../json_error_handler'
require_relative '../resource_methods'
require_relative '../../logging'

module Stencil
  module Api
    class Index < Webmachine::Resource

      include Logging
      include JsonErrorHandler
      include ResourceMethods

      def allowed_methods
        ['GET']
      end

      def content_types_provided
        [["application/json", :to_json]]
      end

      def to_json
        {
            _items: [
                {id: 10001, name: "10001"},
                {id: 10002, name: "10002"},
            ]
        }.to_json
      end

    end
  end
end