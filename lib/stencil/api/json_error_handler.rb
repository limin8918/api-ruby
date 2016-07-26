require 'json'
require 'stencil/logging'

module Stencil
  module Api
    module JsonErrorHandler

      include Stencil::Logging

      def handle_exception e
        logger.error("#{e.message} #{e.backtrace.join("\n")}")
        response.headers['Content-Type'] = "application/json"
        response.body = {:message => e.message, :backtrace => e.backtrace }.to_json
        response.code = 500
      end

    end

  end
end
