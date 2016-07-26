shared_examples_for "error handling" do

  let(:response_body) { JSON.parse(last_response.body, symbolize_names: true) }

  it "returns a json body" do
    expect(last_response.content_type).to eq "application/json"
  end

  it "returns a 500 error code" do
    expect(last_response.status).to eq 500
  end

  it "returns a body with an error message" do
    expect(response_body[:message]).to_not be_nil
  end

  it "returns a body with the error backtrace" do
    expect(response_body[:backtrace]).to be_instance_of(Array)
  end

end