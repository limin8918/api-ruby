require 'stencil/api'

module Stencil
  module Api
    module Resources
      describe Index do

        include WebmachineRackTestMethods

        def app
          Stencil::API
        end

        describe "get" do
          context "when successful" do

            before do
            end

            let(:body_hash) { JSON.parse(last_response.body, symbolize_names: true)}
            let(:links) { { some: 'links' } }

            subject { get("/index") }

            it "returns application/hal+json" do
              subject
              expect(last_response.content_type).to eq "application/hal+json"
            end

            it "returns the HAL Index links" do
              subject
              expect(body_hash[:_items].length).to eq 2
              expect(body_hash[:_items].first[:id]).to eq 10001
            end

          end

          context "when an error occurs" do

            before do
              allow_any_instance_of(Index).to receive(:to_json).and_raise('ERROR')
              get("/index")
            end

            include_examples "error handling"
          end
        end
      end
    end
  end
end
