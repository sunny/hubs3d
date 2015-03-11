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

      post = Hubs3D::API.post("/some/path", foo: "bar")
      post.must_equal({ "answer" => 42 })
    end
  end
end
