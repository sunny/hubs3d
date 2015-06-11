require "spec_helper"

describe Hubs3D::API do
  describe ".post" do
    it "posts" do
      stub_request(:post, "http://test.3dhubs.com/api/v1/some/path")
        .with(body: { "foo" => "bar" },
              headers: {
                'Accept' => 'application/json',
                'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Authorization' => /\AOAuth/,
                'Content-Type' => 'application/x-www-form-urlencoded',
                'User-Agent' => 'OAuth gem v0.4.7',
              })
        .to_return(status: 200, body: '{ "answer": 42 }')

      post = described_class.post("/some/path", foo: "bar")
      expect(post).to eq("answer" => 42)
    end
  end
end
