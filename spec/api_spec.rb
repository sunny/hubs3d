require "spec_helper"

describe Hubs3D::API do
  describe ".post" do
    let(:http_headers) do
      {
        'Accept' => 'application/json',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization' => /\AOAuth/,
        'Content-Type' => 'application/x-www-form-urlencoded',
        'User-Agent' => 'OAuth gem v0.4.7',
      }
    end

    it "returns the parsed json when the request is succesful" do
      stub_request(:post, "http://test.3dhubs.com/api/v1/some/path")
        .with(body: { "foo" => "bar" }, headers: http_headers)
        .to_return(status: 200, body: '{ "answer": 42 }')

      post = described_class.post("/some/path", foo: "bar")
      expect(post).to eq("answer" => 42)
    end

    it "raises when the response is an array containing an error" do
      stub_request(:post, "http://test.3dhubs.com/api/v1/some/path")
        .with(body: { "foo" => "bar" }, headers: http_headers)
        .to_return(status: 200, body: '["error message"]')

      expect do
        described_class.post("/some/path", foo: "bar")
      end.to raise_error(Hubs3D::Exception, "error message")
    end
  end
end
