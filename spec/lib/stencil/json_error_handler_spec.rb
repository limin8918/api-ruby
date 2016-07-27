require 'spec_helper'

module Stencil
  module Api
    module Resources
      describe JsonErrorHandler do

        include WebmachineRackTestMethods

        class TestResource < Webmachine::Resource
          include JsonErrorHandler

          def content_types_provided
            [["application/json",  :to_json]]
          end

          def allowed_methods
            ['POST']
          end

          def process_post
            raise "ERROR!"
          end
        end

        def app
          webmachine_test_rack_app TestResource
        end

        before do
          post("/")
        end

        include_examples "error handling"

        let(:response_body_hash) { JSON.parse(last_response.body, symbolize_names: true)}

        it "includes the error text in the message" do
          expect(response_body_hash[:message]).to include "ERROR!"
        end

      end
    end
  end
end

