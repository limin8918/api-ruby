require 'json'
require 'stencil/logging'

module Stencil
  module Api

    module ResourceMethods

      def resource_uri
        # In prod, the netscaler is addressed with https, but the server instance receives the request as http
        # To allow clients to use the HAL URLs, we need to return the correct scheme
        remove_trailing_slash(remove_params(set_scheme(request.uri.to_s)))
      end

      def base_uri
        remove_path(resource_uri)
      end

      private

      def remove_path uri
        uri.scan(%r{.*://[^/]+})[0]
      end

      def set_scheme uri
        uri.gsub(/^[^:]+/, 'https')
      end

      def remove_params uri
        uri.gsub(/\?.*/,'')
      end

      def remove_trailing_slash uri
        uri.chomp('/')
      end

    end

  end
end
