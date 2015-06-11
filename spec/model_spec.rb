require "spec_helper"
require "hubs3d/model"

describe Hubs3D::Model do
  let(:model) { described_class.new(name: "Foo", path: "example.stl") }

  describe "#name" do
    it "returns the name" do
      expect(model.name).to eq("Foo")
    end
  end

  describe "#path" do
    it "returns the path" do
      expect(model.path).to eq("example.stl")
    end
  end

  pending "#id"
  pending "#attachments"
end
