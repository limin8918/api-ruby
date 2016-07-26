require 'stencil/api/resource_methods'

module Stencil
  module Api
    describe ResourceMethods do

      class TestingResource
        include ResourceMethods

        def request; end
      end

      let(:uri) { 'http://example.org/trigger/' }
      let(:request) { OpenStruct.new(:uri => URI(uri)) }
      let(:test_resource) { TestingResource.new }

      before do
        expect(test_resource).to receive(:request).and_return(request)
      end

      describe "resource_uri" do

        it "returns the resource URL with the correct scheme" do
          expect(test_resource.resource_uri).to start_with("https://")
        end

        it "strips the trailing slash" do
          expect(test_resource.resource_uri).to eq "https://example.org/trigger"
        end

        context "with params" do
          let(:uri) { 'http://example.org/trigger/?some=param' }

          it "removes the parameters" do
            expect(test_resource.resource_uri).to end_with("example.org/trigger")
          end

        end
      end

      describe "base_uri" do
        it "returns the request URI without the path or params" do
          expect(test_resource.base_uri).to eq("https://example.org")
        end
      end

    end
  end
end
