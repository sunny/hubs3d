require "spec_helper"
require "hubs3d/model"

describe Hubs3D::Model do
  let(:model) {
    described_class.new(name: "foo.stl", path: "spec/fixtures/example.stl")
  }

  describe "#name" do
    it "returns the name" do
      expect(model.name).to eq("foo.stl")
    end
  end

  describe "#path" do
    it "returns the path" do
      expect(model.path).to eq("spec/fixtures/example.stl")
    end
  end

  describe "#id" do
    it "sends a request" do
      stub_request(:post, "https://www.3dhubs.com/api/v1/model")
         .with(body: {"file"=>"Rk9vTwo=\n", "fileName"=>"foo.stl"},
               headers: {'Accept' => 'application/json'})
         .to_return(status: 200, body: '{"modelId":"42"}')

      expect(model.id).to eq(42)
    end
  end

  describe "#attachments" do
    it "returns the attachments" do
      model = described_class.new(attachments: { foo: 42 })
      expect(model.attachments).to eq({ foo: 42 })
    end
  end
end
